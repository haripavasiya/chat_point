class MessageDetailsModel{
  String _type;
  String _message;
  String _time;

  get type => _type;
  get message => _message;
  get time => _time;

  MessageDetailsModel(this._type, this._message, this._time);
}