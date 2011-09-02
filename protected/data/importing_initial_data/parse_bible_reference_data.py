import time
from read_bible import read_kjv

def parse_data(filename):
    """return a list of dictionaries"""
    f = open(filename,'r')
    data = []
    
    # Chap,Verse,Chap,Verse,StartWord,Heading,Entry,Author,Page,Page,ISBN/URL,Category,Depth
    for line in f:
        if line.isspace():
            continue
        d = dict()
        line = line.replace('\t"','\t::::')
        line = line.replace('"\t','::::\t')
        values = line.split('\t')
        print values
        if len(values) > 0 and values[0] and values[0] != '0': d['start_chp'] = values[0]
        if len(values) > 1 and values[1]: d['start_verse'] = values[1]
        if len(values) > 2 and values[2]: d['end_chp'] = values[2]
        if len(values) > 3 and values[3]: d['end_verse'] = values[3]
        if len(values) > 4 and values[4]: d['start_word'] = values[4]
        if len(values) > 5 and values[5]: d['heading'] = values[5].replace('::::','')
        if len(values) > 6 and values[6]: d['entry_text'] = values[6].replace('::::','')
        if len(values) > 7 and values[7]: d['ref_author'] = values[7]
        if len(values) > 8 and values[8]: d['start_page'] = values[8]
        if len(values) > 9 and values[9]: d['end_page'] = values[9]
        if len(values) > 10 and values[10]: d['ref_source'] = values[10]
        if len(values) > 11 and values[11]: d['categories'] = values[11].replace('::::','').replace(', ',',').replace('"','').split(',')  # list of categories
        if len(values) > 12 and values[12].strip(): d['depth'] = values[12].strip()  # remove the \n
        data.append(d)
    return data

def collect_categories(data):
    """assumes data is a list returned by parse_data"""
    categories = []
    for record in data[1:]: #skip first "record" which contains column headers in spreadsheet
        if 'categories' in record.keys():
            cats = record['categories']
            for cat in cats:
                if not cat == 'Category':
                    put_in_set(categories, cat)
    
    print categories
    return categories

def put_in_set(l, elem):
    """appends elem into list l if not already in l"""
    elem = elem.title()
    if elem == 'Cf' or elem == 'cf.' or elem == 'Cf.':
        elem = 'cf'
    if elem.isalnum() and not elem in l:
        l.append(elem)

def main():
    """ main script to generate sql for all data"""
    bible = read_kjv('bible13.txt')
    deut_data = parse_data('Deuteronomy.txt')
    josh_data = parse_data('Joshua.txt')
    judge_data = parse_data('Judges.txt')
    john_data = parse_data('John.txt')
    tim1_data = parse_data('1Timothy.txt')
    
    outfile = open('all_entries.sql','w')
    
    # table creation
    tbl_creation_script = open('table_creation.sql')
    for line in tbl_creation_script:
        outfile.write(line)
    outfile.write('\n-- END TABLE CREATION --\n\n')
    
    # insert categories
    categories = collect_categories(deut_data + josh_data + judge_data + john_data + tim1_data)
    for cat in categories:
        outfile.write('INSERT INTO tbl_category'    \
            + ' (name) VALUES (\'' + cat + '\');\n')
            
    outfile.write('\n-- END CATEGORIES INSERTION --\n\n')
    
    generate_sql_entries_for_book(outfile, deut_data, bible, 'Deuteronomy')
    generate_sql_entries_for_book(outfile, josh_data, bible, 'Joshua')
    generate_sql_entries_for_book(outfile, judge_data, bible, 'Judges')
    generate_sql_entries_for_book(outfile, john_data, bible, 'John')
    generate_sql_entries_for_book(outfile, tim1_data, bible, '1 Timothy')
    
    # close outfile
    outfile.close()

def generate_sql_entries_for_book(outfile, data, bible, book):
    """data is a list returned by parse_data, bible_dict is a
    dictionary returned by read_bible, and book is a book in the
    Bible"""
    
    #outfile = open(book + '_entries.sql','w')
    outfile.write('\n-- BEGIN INSERTION FOR ' + book + ' --\n\n')
    book_num = 0
    for num, b in bible.keys():
        if b == book:
            book_num = num
            print book_num
            break
            
    # insert entries
    for record in data[1:]:
        print record
        keys = record.keys()
        sql_record = {}
        
        # required/assumed to be present attributes
        sql_record['entry_author_id'] = 1   # admin user
        sql_record['entry_text'] = record['entry_text'].replace(r"'",r'\'').replace(r'""',r'\"')
        sql_record['date_added'] = time.strftime("%Y-%m-%d", time.localtime())
        
        # optional but direct-mapping attributes
        if 'start_word' in keys: sql_record['start_word'] = record['start_word']
        if 'heading' in keys: sql_record['heading'] = record['heading'].replace(r"'",r'\'').replace(r'""',r'\"')
        if 'depth' in keys: sql_record['depth'] = record['depth']
        if 'ref_author' in keys: sql_record['ref_author'] = record['ref_author']
        if 'start_page' in keys: sql_record['ref_start_page_num'] = record['start_page']
        if 'end_page' in keys: sql_record['ref_end_page_num'] = record['end_page']
        if 'ref_source' in keys: sql_record['ref_source'] = record['ref_source']
        
        # figure out verse FK's
        if 'start_chp' in keys:
            start_chp = int(record['start_chp'])
            
            if 'start_verse' in keys:
                start_verse = int(record['start_verse'])
            else:
                start_verse = 1
            
            if 'end_chp' in keys:
                end_chp = int(record['end_chp'])
            else:
                end_chp = start_chp
                
            if 'end_verse' in keys:
                end_verse = int(record['end_verse'])
            else:
                end_verse = len(bible[(book_num,book)][end_chp])
            
            start_verse_id = bible[(book_num,book)][start_chp][start_verse][0]
            end_verse_id = bible[(book_num,book)][end_chp][end_verse][0]
            sql_record['start_verse_id'] = start_verse_id
            sql_record['end_verse_id'] = end_verse_id
        
        # build sql for tbl_entry
        sql = 'INSERT INTO tbl_entry\n\t('
        attrs = sql_record.keys()
        for attr in attrs[:-1]:
            sql += '`' + attr + '`,'
        sql += '`' + attrs[-1] + '`)\n\tVALUES ('
        for attr in attrs[:-1]:
            if attr == 'start_verse_id' or attr == 'end_verse_id' or attr == 'entry_author_id' or attr == 'depth' \
                or attr == 'ref_start_page_num' or attr == 'ref_end_page_num':
                sql += str(sql_record[attr]) + ','
            elif attr == 'start_word' or attr == 'ref_author' or attr == 'heading' or attr == 'ref_source': # no double quotes
                sql += "'" + sql_record[attr] + "'" + ','
            elif attr == 'entry_text':
                sql += "'" + sql_record[attr].replace('""','"') + "'" + ','
            elif attr == 'date_added':
                sql += "'" + sql_record[attr] + "'" + ','
        sql += "'" + sql_record[attrs[-1]].replace('""','"') + "'" + ');\n' # last attribute is entry_text
        
        outfile.write(sql)
        
        # build sql for tbl_entry_category
        if 'categories' in record.keys():
            for cat in record['categories']:
                if cat == 'cf' or cat == 'cf.' or cat == 'Cf' or cat == 'Cf.':
                    cat = 'cf'
                sql = 'INSERT INTO tbl_entry_category\n\t(`entry_id`,`category_id`)\nVALUES ('
                sql += '\n\t(SELECT entry_id from tbl_entry WHERE '
                if 'start_chp' in keys:
                    sql += 'start_verse_id='
                    sql += str(sql_record['start_verse_id']) + ' AND end_verse_id='
                    sql += str(sql_record['end_verse_id']) + ' AND '
                sql += 'entry_text=\''
                sql += sql_record['entry_text'].replace('""','"') + '\'),\n\t'
                sql += '(SELECT category_id from tbl_category WHERE name=\''
                sql += cat.strip() + '\')\n);\n'
                outfile.write(sql)
        
        outfile.write('\n')
        
    outfile.write('\n-- END ENTRIES INSERTION FOR ' + book + '--\n\n')
    
    
    # close file
    #outfile.close()