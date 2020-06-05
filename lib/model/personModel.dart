class Person{
final String id;
final String name;
final int age;
final String job;

Person({this.id,this.name,this.age,this.job});
factory Person.fromJson(Map<String ,dynamic> json){
  return Person(
    id:json['id'],
    name:json['name'],
    age: json['age'],
    job: json["job"]

  );
}

}