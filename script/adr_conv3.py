#!/usr/bin/python
# adr_conv.py
#
# Converts a vCard address book into abook addressbook format
#
# Author:   Gavin Costello (gavcos@gmail.com)
# Date:     19.02.2009

import optparse

desc="""This program converts a gmail vCard address book into a format readable by abook
(http://abook.sourceforge.net).

To export your gmail contacts in vCard format, select Contacts -> Export and choose the 3rd export format (vCard).

The file will be saved by default as contacts.vcf

"""

parser = optparse.OptionParser(description=desc, version='%prog version 1.0')

parser.add_option('-i', '--inputfile', \
        dest='inputfile', action='store', default='contacts.vcf', \
        help='The name of the vCard file containing the contacts to convert (default=%default)')
parser.add_option('-o', '--outputfile', \
        dest='outputfile', action='store', default='addressbook', \
        help='The name of the output file to be generated by this script (default=%default)')
parser.add_option('-d', '--debug', \
        dest='debug', action='store_true', default=False,
        help='Print debug statements (default=%default)')

(opts, args) = parser.parse_args()

name = '';  # Contact name
phone = ''; # Contact phone
email = ''; # Contact email
nick = '';  # Contact nickname
count = 0; # Contacts count

# Open input file, read-only
try:
    cfile = open(opts.inputfile, 'r')
except IOError:
    print('Unable to open input file: %s' % opts.inputfile)
    raise

# Open output file for writing
try:
    ofile = open(opts.outputfile, 'w+')
except IOError:
    print('Unable to open output file: %s' % opts.outputfile)
    raise

ofile.write('\n')
ofile.write('[format]\n')
ofile.write('program=abook\n')
ofile.write('\n')

# Loop through input file
for line in cfile.readlines():
    # Name field
    if (line.startswith('FN')):
        name = line.split(':')[1]
        #name = unicode(name, 'utf-8')
        ofile.write('\n')
        ofile.write('[%d]\n' % count)
        count += 1
        name = str(name)
        if opts.debug:
            print(name, end="")
        ofile.write('name=%s' % name)
    elif (line.startswith('EMAIL')):
        email = line.split(':')[1]
        ofile.write('email=%s' % email)
    elif (line.startswith('TEL')):
        # Verify if it's a fax number
        parts = line.split(';')
        if (len(parts) > 2): # Fax number
            phone = parts[2].split(':')[1]
            ofile.write('fax=%s' % phone)
            continue

        # Normal telephone number
        try:
            tel = parts[1]
        except IndexError: # Phone type not defined (other in gmail)
            phone = line.split(':')[1]
            ofile.write('mobile=%s' % phone)
            continue

        fulltype = tel.split('=')[1]
        type = fulltype.split(':')[0]
        if opts.debug:
            print('type=%s' % type,)

        phone = line.split(':')[1]
        if (type == 'HOME'):
            ofile.write('phone=%s' % phone)
        if (type == 'CELL'):
            ofile.write('mobile=%s' % phone)
        if (type == 'WORK'):
            ofile.write('workphone=%s' % phone)
    elif (line.startswith('NOTE')):
        # Notes / nicknames
        try:
            nick = line.split(':')[2]
        except IndexError:
            nick = line.split(':')[1]
        ofile.write('nick=%s\n' % nick.strip())
    else:
        continue;

print('\n%s contacts processed' % count)

try:
    cfile.close()
except IOError:
    print('Unable to close input file: %s' % opts.inputfile)
    raise
try:
    ofile.close()
except IOError:
    print('Unable to close output file: %s' % opts.outputfile)
    raise

exit(0)