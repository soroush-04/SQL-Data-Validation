
import sqlite3


conn = sqlite3.connect('task3.db')

cursor = conn.cursor()

cursor.execute("PRAGMA table_info('task3qq')")
table1_columns = [column[1] for column in cursor.fetchall()]

cursor.execute("PRAGMA table_info('task3sqr')")
table2_columns = [column[1] for column in cursor.fetchall()]

common_columns = set(table1_columns).intersection(table2_columns)

conn.close()

print(common_columns)
