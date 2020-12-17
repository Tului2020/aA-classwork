# == Schema Information
#
# Table name: nobels
#
#  yr          :integer
#  subject     :string
#  winner      :string

require_relative './sqlzoo.rb'

def physics_no_chemistry
  # In which years was the Physics prize awarded, but no Chemistry prize?
  execute(<<-SQL)
  select distinct yr
  from nobels
  where subject = 'Physics' and yr not in (SELECT DISTINCT yr
  FROM nobels
  WHERE subject = 'Chemistry')
  SQL

end



physics_no_chemistry.each {|el| p el}
