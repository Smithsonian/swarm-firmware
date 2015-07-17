import re
import argparse
import xml.dom.minidom as md

def common_heirarchy(src, dest):
    out = u''
    curr_char = 0
    is_char_same = True
    while is_char_same:
        try:
            is_char_same = src[curr_char] == dest[curr_char]
            out += src[curr_char]
            curr_char += 1
        except IndexError:
            is_char_same = False
    return 'system/' + '/'.join(out.split('/')[:-1])

parser = argparse.ArgumentParser(description='Parse and print useful information about a TWX timing report.')
parser.add_argument('--min-slack', dest='min_slack', type=float, help='only show failing heirarchies with this much slack')
parser.add_argument('--sum-hierarchy', dest='sum_hier', type=str, help='show a sum of slack for a particular hierarchy (regex allowed!)')
parser.add_argument('report_file', type=str, help='report file, must be *.twx')
args = parser.parse_args()

root = md.parse(args.report_file)
paths = root.getElementsByTagName('twConstPath')
report_score = int(root.getElementsByTagName('twScore')[0].firstChild.nodeValue)
report_errors = int(root.getElementsByTagName('twErrCnt')[0].firstChild.nodeValue)
measured_score = int(sum(list(float(path.firstChild.firstChild.nodeValue) for path in paths)) * -1000)

print "Reported score: %d on %d failing paths" % (report_score, report_errors) 
print "Measured slack: %d on %d failing paths" % (measured_score, len(paths))

unique_heirarchies = {}
unique_heir_errors = {}
for path in paths:
    src = path.childNodes[1].firstChild.nodeValue
    dest = path.childNodes[2].firstChild.nodeValue
    common = common_heirarchy(src, dest)
    slack = -1 * float(path.firstChild.firstChild.nodeValue)
    tot_slack = unique_heirarchies.get(common, 0.0)
    unique_heirarchies[common] = tot_slack + slack
    tot_error = unique_heir_errors.get(common, 0)
    unique_heir_errors[common] = tot_error + 1


print "Total unique common heirarchies: %d" % len(unique_heirarchies)

def sort_by_slack(key):
    return unique_heirarchies[key]

user_sum = 0.0
for heir in sorted(unique_heirarchies, key=sort_by_slack):
    slack = unique_heirarchies[heir]
    errors = unique_heir_errors[heir]
    if args.sum_hier:
        if re.match(args.sum_hier, heir):
            heir = re.sub(args.sum_hier, args.sum_hier, heir)
            user_sum += slack
        else:
            continue
    if slack > args.min_slack:
        print "%6.2f ns %12s ==> '%s'" % (slack, "(%d errors)" % errors, heir)

if args.sum_hier:
    print "User requested slack %6.2f ns ==> '%s'" % (user_sum, args.sum_hier)
