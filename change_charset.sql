ALTER DATABASE db_smf_50 CHARACTER SET utf8 COLLATE utf8_general_ci;

SHOW VARIABLES LIKE "CHARACTER_SET_DATABASE";

mysqldump --add-drop-table -u root --password='password' testmigration | sed -e 's/CHARSET\=latin1/CHARSET\=utf8\ COLLATE\=utf8_general_ci/g' | iconv -f latin1 -t utf8 | mysql -u root --password='password' testmigration