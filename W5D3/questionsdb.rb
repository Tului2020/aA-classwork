require 'sqlite3'
require 'singleton'


class QuestionsDatabase < SQLite3::Database
    include Singleton

    def initialize
        super('questions.db')
        self.type_translation = true
        self.results_as_hash = true
    end  
end

class Question

    attr_accessor :id, :title, :body, :user_id

    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @user_id = options['user_id']
    end
    
    def self.all
        questions = QuestionsDatabase.instance.execute('select * from questions')
        questions.map {|question| Question.new(question)}
    end


    def self.find_by_id(id)
        questions = QuestionsDatabase.instance.execute('select * from questions where id = ' + id.to_s)
        questions.map {|question| Question.new(question)}
    end

    # def self.find_by_id(id)
    #     questions = QuestionsDatabase.instance.execute(<<-SQL,id)
    #     SELECT
    #         *
    #     FROM 
    #         questions
    #     WHERE
    #         id = ?
    #     SQL
    #     questions.map {|question| Question.new(question)}
    # end


end



class User

    attr_accessor :first_name, :last_name

    def initialize(name)
        @first_name = name['fname']
        @last_name = name['lname']
    end

    def self.find_by_name(fname, lname)
        users = QuestionsDatabase.instance.execute("select * from users where fname = \'#{fname}\' and lname = \'#{lname}\'")
        users.map {|user| User.new(user)}
    end 

end



class QuestionFollow
end

class Reply
end

class QuestionLikes
end



p User.find_by_name('Tului', 'Gantulga')







# p Question.all
# db = Question.all
# p Question.find_by_id(3)



# db = SQLite3::Database.new('./questions.db')
# q1 = db.execute('select * from questions').map {|el| el}
# q1.each {|el| p el}
# question1 = q1[0]
# p question1

