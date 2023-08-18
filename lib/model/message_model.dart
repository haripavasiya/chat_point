import 'dart:ui';

class MessageModel{
  String _imageUrl;
  Color _color;
  String _name;
  String _status;
  String _isOnline;
  String _messageCount;

  get imageUrl => _imageUrl;
  get color => _color;
  get name => _name;
  get status => _status;
  get isOnline => _isOnline;
  get messageCount => _messageCount;

  MessageModel(this._imageUrl, this._color,this._name, this._status, this._isOnline, this._messageCount);
}