posts = [{ 
           title: "Haskell programming language", 
           content: "Haskell is an advanced purely-functional programming language. An open-source product of more than twenty years of cutting-edge research, it allows rapid development of robust, concise, correct software. With strong support for integration with other languages, built-in concurrency and parallelism, debuggers, profilers, rich libraries and an active community, Haskell makes it easier to produce flexible, maintainable, high-quality software. http://www.haskell.org/haskellwiki/Haskell", 
           tags_attributes: [{ name: "Programming" }] }, 
         
         { 
           title: "Ruby programming language",
           content: "Ruby is a dynamic, reflective, general-purpose object-oriented programming language that combines syntax inspired by Perl with Smalltalk-like features. It was also influenced by Eiffel and Lisp. Ruby was first designed and developed in the mid-1990s by Yukihiro 'Matz' Matsumoto in Japan.
Ruby supports multiple programming paradigms, including functional, object oriented, imperative and reflective. It also has a dynamic type system and automatic memory management; it is therefore similar in varying respects to Smalltalk, Python, Perl, Lisp, Dylan, Pike, and CLU. http://en.wikipedia.org/wiki/Ruby_(programming_language)",
           tags_attributes: [{ name: "Programming" }] },

         { 
           title: "Python programming language",
           content: "Python is a general-purpose, interpreted high-level programming language whose design philosophy emphasizes code readability. Its syntax is said to be clear and expressive. Python has a large and comprehensive standard library. http://en.wikipedia.org/wiki/Python_(programming_language)",
           tags_attributes: [{ name: "Programming" }]
         }]


user = User.create(email: "admin@admin.com", username: "admin", password: "admin123", posts_attributes: posts)

posts = []
for i in 0..1000
  posts << { 
              title: "Python #{ i }",
              content: "Python is a general-purpose, interpreted high-level programming language whose design philosophy emphasizes code readability. Its syntax is said to be clear and expressive. Python has a large and comprehensive standard library. http://en.wikipedia.org/wiki/Python_(programming_language)",
              tags_attributes: [{ name: "Programming" }]
  }
end

user = User.create(email: "daniel@daniel.com", username: "daniel", password: "daniel123", posts_attributes: posts)
