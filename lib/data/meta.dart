class MetaDataElement {
  final String source;
  final String contact;
  final String info;
  final DateTime lastUpdate;
  final DateTime lastCheckedForUpdate;

  MetaDataElement(this.source, this.contact, this.info, this.lastUpdate, this.lastCheckedForUpdate);

  MetaDataElement.fromJson(Map<String, dynamic> json) :
      source = json['source'],
      contact = json['contact'],
      info = json['info'],
      lastUpdate = DateTime.parse(json['lastUpdate']),
      lastCheckedForUpdate = DateTime.parse(json['lastCheckedForUpdate']);
}
