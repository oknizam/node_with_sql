Design patterns are resusable solutions to common design problems

1. Creational design patterns
2. Structural design patterns 
3. Behavioral design patterns

1. Creational design patterns

  1. Singleton  -> how objects are created

    1. Only one instance exist
    2. use cases
      1. config
      2. Logger
      3. DbConnections

      class Singleton{

        constructor(){
          if(Singleton.instance) return Singleton.instance;
          Singleton.instance = this;
        }
      }

  2. Factory 

    1. Create objects without exposing creation logic

    2. use cases
      1. UI components
      2. API response handler

      function createUser(type){
        if(type==="admin") return {role:"admin"}

        if(type==="supervisor") return {role:"supervisor"}
      }


2. Structural Design patterns (how things are connected)

  1. Adapter

    convert one interface to another

    BE response:

    const apiResponse = {first_name:"nizam"};

    FE:
    const adapted = {name:apiResponse.first_name};

  2. Decorator

    add functionality without modifying existing code

    Passing callback function which will be get executed independet of other functionality

3. Behavioural design patterns (communication between objects)

  1. Observer (one to many)
    1. use cases
      1. React state update
      2. redux
      3. Event listeners

  2. Startegy

    choose algorithem at runtime

  3. Command

    Enacapsulate request as an object

    showing necessary details , hiding unccessary details like salary for this we create private fields




  
  