solution_code = <<-SQL
  CREATE TABLE passengers (
    id SERIAL PRIMARY KEY,
    passport_number VARCHAR(20),
    name TEXT,
    contact_data JSONB
  );
SQL

check_function = <<-RUBY
  def check(db, query, result)
    t = db.execute_statement('PRAGMA table_info(passengers);')
    b_rows = t.size == 5
    b_id = t[1][1].downcase == 'id' && t[1][2].downcase == 'serial' && t[1][5] == 1
    b_pn = t[2][1].downcase == 'passport_number' && t[2][2].downcase == 'varchar(20)'
    b_n =  t[3][1].downcase == 'name' && t[3][2].downcase == 'text'
    b_cd = t[4][1].downcase == 'contact_data' && t[4][2].downcase == 'jsonb'
    b_rows && b_id && b_pn && b_n && b_cd
  end
RUBY

sql_problem = SqlProblem.create!(
  initial_code: nil,
  solution_code: solution_code,
  check_function: check_function
)

description = <<-TEXT
  В схеме, по которой мы будем работать, пассажиры явным образом не указаны.
  Создайте таблицу пассажиров **passengers** с теми же полями пассажиров, что есть сейчас в таблице **tickets**.
  Не забудьте про первичный ключ - **id** - с автоинкрементом.
TEXT

problem_content = SqlProblemContent.create!(
  lecture_id: 1,
  serial_number: SqlProblemContent.count + 1,
  title: 'Создание таблицы',
  body: description,
  sql_problem: sql_problem
)

WikidataItemsToLectureContent.create!(
  [
    {
      lecture_content: problem_content.acting_as,
      wikidata_item: WikidataItem.find_by!(name: 'CREATE'),
      priority: 1
    },
    {
      lecture_content: problem_content.acting_as,
      wikidata_item: WikidataItem.find_by!(name: 'TABLE')
    },
    {
      lecture_content: problem_content.acting_as,
      wikidata_item: WikidataItem.find_by!(name: 'COLUMN')
    }
  ]
)