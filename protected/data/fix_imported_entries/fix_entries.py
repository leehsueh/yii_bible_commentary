id_ranges = '35,46-47,57,59-60,74-75,77-79,81-84,86,88,90-91,93-94,96,101,105,107-111,113-116,121,132-163,165-169,171-179,181-265,268-362,364-372,378-380,383-409,416-423,430-529,531-546,548-563'

id_ranges_list = id_ranges.split(',')
where_clause = 'where ('
for range in id_ranges_list:
    numbers = range.split('-')
    if len(numbers) == 2:
        low = numbers[0]
        high = numbers[1]
        where_clause += 'OR entry_id between ' + str(low) + ' and ' + str(high) + '\n'
    else:
        low = numbers[0]
        where_clause += 'OR entry_id = ' + str(low) + '\n'
where_clause += ') AND start_verse_id <> end_verse_id'  #only touch entries that are explicitly wrong
print 'select entry_id,heading,entry_text,start_verse_id,end_verse_id from tbl_entry\n' + where_clause
print 'update tbl_entry set end_verse_id = start_verse_id\n' + where_clause
        
# query contains entry for 538, but inspection contains entry 105 instead
