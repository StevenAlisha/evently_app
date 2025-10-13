class Event{
  static const String collectionName='Events';
 String id;
 String title;
 String description;
  String eventImage;
 String eventName;
 DateTime eventDate;
 String eventTime;
 bool isFavorite;
Event({
  this.id='',
  required this.eventName,
  required this.title,
  required this.description,
  required this.eventDate,
  required this.eventImage,
  required this.eventTime,
  this.isFavorite=false,


});

Map<String,dynamic> toFireStore(){
  return{
    'id':id,
    'title':title,
    'description':description,
    'event_name':eventName,
    'event_time':eventTime,
    'event_image':eventImage,
    'event_date':eventDate.millisecondsSinceEpoch ,
    'is_favorite':isFavorite,
  };

}
Event.fromFireStore(Map<String,dynamic>data):this(
    id: data['id'],
    title: data['title'],
    description: data['description'],
    eventName: data['event_name'],
    eventTime: data['event_time'],
    eventImage: data['event_image'],
    eventDate: DateTime.fromMillisecondsSinceEpoch(data['event_date']),
    isFavorite: data['is_favorite']

);

}