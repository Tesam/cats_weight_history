const String dbName = 'cats.db';

const String breedTableName = 'breed';
const String catTableName = 'cat';
const String weightHistoryTableName = 'weight_history';
const String weightHistoryDetailTableName = 'weight_history_detail';

/* This create sentences order must be respected, to avoid sql syntax errors
  1°- Tables without foreign keys
  2°- Tables with foreign keys
  */
const String breedCreateSql = '''
  CREATE TABLE IF NOT EXISTS $breedTableName( 
    id integer, 
    breed text NOT NULL, 
    breed text NOT NULL, 
    PRIMARY KEY(id AUTOINCREMENT)
  ); 
  ''';

const String catCreateSql = '''
  CREATE TABLE IF NOT EXISTS $catTableName( 
    id INTEGER, 
    cat TEXT, 
    breed_id INTEGER, 
    PRIMARY KEY(id AUTOINCREMENT), 
    FOREIGN KEY(breed_id) REFERENCES $breedTableName (id)
  ); 
  ''';

const String weightHistoryCreateSql = '''
  CREATE TABLE IF NOT EXISTS $weightHistoryTableName ( 
    id INTEGER, 
    cat_id INTEGER, 
    current_weight REAL, 
    FOREIGN KEY(cat_id) REFERENCES $catTableName (id), 
    PRIMARY KEY(id AUTOINCREMENT) 
  ); 
  ''';

const String weightHistoryDetailCreateSql = '''
  CREATE TABLE IF NOT EXISTS $weightHistoryDetailTableName ( 
    id INTEGER, 
    weight REAL, 
    weight_date DATE, 
    weight_history_id INTEGER, 
    FOREIGN KEY(weight_history_id) REFERENCES $weightHistoryTableName (id), 
    PRIMARY KEY(id AUTOINCREMENT) 
  );        
  ''';