﻿INSERT INTO ctry_state VALUES
('01', 'Alabama'),
('02', 'Alaska'),
('04', 'Arizona'),
('05', 'Arkansas'),
('06', 'California'),
('08', 'Colorado'),
('09', 'Connecticut'),
('10', 'Delaware'),
('11', 'DC'),
('12', 'Florida'),
('13', 'Georgia'),
('15', 'Hawaii'),
('16', 'Idaho'),
('17', 'Illinois'),
('18', 'Indiana'),
('19', 'Iowa'),
('20', 'Kansas'),
('21', 'Kentucky'),
('22', 'Louisiana'),
('23', 'Maine'),
('24', 'Maryland'),
('25', 'Massachusetts'),
('26', 'Michigan'),
('27', 'Minnesota'),
('28', 'Mississippi'),
('29', 'Missouri'),
('30', 'Montana'),
('31', 'Nebraska'),
('32', 'Nevada'),
('33', 'New Hampshire'),
('34', 'New Jersey'),
('35', 'New Mexico'),
('36', 'New York'),
('37', 'North Carolina'),
('38', 'North Dakota'),
('39', 'Ohio'),
('40', 'Oklahoma'),
('41', 'Oregon'),
('42', 'Pennsylvania'),
('44', 'Rhode Island'),
('45', 'South Carolina'),
('46', 'South Dakota'),
('47', 'Tennessee'),
('48', 'Texas'),
('49', 'Utah'),
('50', 'Vermont'),
('51', 'Virginia'),
('53', 'Washington'),
('54', 'West Virginia'),
('55', 'Wisconsin'),
('56', 'Wyoming'),
('CA', 'Canada'),
('MX', 'Mexico'),
('PR', 'Puerto Rico'),
('BS', 'Bahamas'),
('AG', 'Antigua and Barbuda'),
('AI', 'Anguilla'),
('NL', 'Netherlands Antilles (formerly AN)'),
('AW', 'Aruba'),
('CU', 'Cuba'),
('DM', 'Dominica'),
('DO', 'Dominican Republic'),
('GP', 'Guadeloupe'),
('HN', 'Honduras'),
('HT', 'Haiti'),
('JM', 'Jamaica'),
('KN', 'St. Kitts and Nevis'),
('KY', 'Cayman Islands'),
('LC', 'Saint Lucia'),
('MQ', 'Martinique'),
('MS', 'Montserrat'),
('TC', 'Turks and Caicos Islands'),
('VG', 'British Virgin Islands'),
('VI', 'Virgin Islands'),
('AS', 'American Samoa'),
('FM', 'Federated States of Micronesia'),
('GU', 'Guam'),
('KI', 'Kiribati'),
('MH', 'Marshall Islands'),
('QM', 'Midway Islands (formerly MI)'),
('MP', 'Northern Mariana Islands'),
('PW', 'Palau'),
('RU', 'Russia'),
('TK', 'Tokelau'),
('QW', 'Wake Island (formerly WQ)'),
('WS', 'Samoa');

INSERT INTO verif_stat VALUES
('O', 'verified'),
('U', 'unverified');

INSERT INTO lighting VALUES
('R', 'Red'),
('D', 'Medium intensity  White Strobe & Red'),
('H', 'High Intensity White Strobe & Red'),
('M', 'Medium Intensity White Strobe'),
('S', 'High Intensity White Strobe'), 
('F', 'Flood'), 
('C', 'Dual Medium Catenary'), 
('W', 'Synchronized Red Lighting'), 
('L', 'Lighted (Type Unknown)'), 
('N', 'None'),
('U', 'Unknown');

INSERT INTO marking VALUES
('P', 'Orange or Orange and White Paint'),
('W', 'White Paint Only'),
('M', 'Marked'),
('F', 'Flag Marker'),
('S', 'Spherical Marker'), 
('N', 'None'),
('U', 'Unknown');

INSERT INTO hacc VALUES
('1', 20, 'FEET'),
('2', 50, 'FEET'),
('3', 100, 'FEET'),
('4', 250, 'FEET'),
('5', 500, 'FEET'),
('6', 1000, 'FEET'),
('7', 0.5, 'NM'),
('8', 1, 'NM'),
('9', -1, 'UNKNOWN'),
('N', -1, 'NO DATA');

INSERT INTO vacc VALUES
('A', 3, 'FEET'),
('B', 10, 'FEET'),
('C', 20, 'FEET'),
('D', 50, 'FEET'),
('E', 125, 'FEET'),
('F', 250, 'FEET'),
('G', 500, 'FEET'),
('H', 1000, 'FEET'),
('I', -1, 'UNKNOWN'),
('N', -1, 'NO DATA');