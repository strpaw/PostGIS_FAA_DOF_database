import psycopg2


def dms2dd(dms):
    h = dms[-1]
    dms_m = dms[:-1]
    dms_t = dms_m.split(' ')
    d = float(dms_t[0])
    m = float(dms_t[1])
    s = float(dms_t[2])

    dd = d + m / 60 + s / 3600
    if h in ['W', 'S']:
        dd = - dd
    return dd


def dms2dd(dms):
    """ Converts DMS format of latitude, longitude in DOF file to DD format
    param: dms: string, latitude or longitude in degrees, minutes, seconds format
    return: dd: float, latitude or longitude in decimal degrees format
    """
    h = dms[-1]
    dms_m = dms[:-1]
    dms_t = dms_m.split(' ')
    d = float(dms_t[0])
    m = float(dms_t[1])
    s = float(dms_t[2])

    dd = d + m / 60 + s / 3600
    if h in ['W', 'S']:
        dd = - dd
    return dd

def dof2postgis(input_file):
    conn = psycopg2.connect(host="localhost", database="FAA_DOF_db_blog", user="postgres",
                            password="Learnpgsql95")
    cursor = conn.cursor()

    with open(input_file, 'r') as dof_file:
        line_nr = 0
        for line in dof_file:
            line_nr += 1
            if line_nr < 5:
                continue
            else:
                if line_nr % 10000 == 0:
                    print(line_nr)
                oas_code = line[0:2]
                obs_number = line[0:9]
                vs_code = line[10]
                city_name = line[18:34].rstrip(),
                lat_dms = line[35:47]
                lon_dms = line[48:61]
                obs_type = line[62:80].rstrip()

                # If there is missing height above ground level write number -9999
                aglhgt_str = line[83:88].rstrip('0')
                if aglhgt_str == '':
                    agl_height = 0
                else:
                    agl_height = int(aglhgt_str)

                amsl_height = int(line[89:94])

                # If there is missing data for horizontal accuracy - add additional code
                h_acc_code = line[97]
                if h_acc_code == ' ' or h_acc_code == '':
                    h_acc_code = 'N'

                # If there is missing data for vertical accuracy - add additional code
                v_acc_code = line[99]
                if v_acc_code == ' ' or v_acc_code == '':
                    v_acc_code = 'N'

                marking_code = line[101]
                lighting_code = line[95]
                lat_dd = dms2dd(lat_dms)
                lon_dd = dms2dd(lon_dms)
                cursor.execute("""
                    insert into
                        obstruction 
                        (oas_code, 
                         obs_number, 
                         vs_code, 
                         city_name, 
                         lat_dms, 
                         lon_dms,
                         obs_type, 
                         agl_height, 
                         amsl_height, 
                         lighting_code, 
                         h_acc_code,
                         v_acc_code, 
                         marking_code, 
                         geo_location)
                        values
                        (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s,
                        ST_GeomFromText('POINT(%s %s)', 4326));
                       """,
                    (oas_code, obs_number, vs_code, city_name, lat_dms, lon_dms,
                    obs_type, agl_height, amsl_height, lighting_code, h_acc_code,
                    v_acc_code, marking_code, lon_dd, lat_dd))
    conn.commit()
    cursor.close()
    return
