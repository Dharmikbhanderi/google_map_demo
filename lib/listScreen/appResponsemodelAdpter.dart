import 'package:hive/hive.dart';
import 'package:practicalMap/listScreen/homeScreen_controller.dart';

@HiveType(typeId: 1)
class AppResponseModelAdapter extends TypeAdapter<Airport> {
  @override
  final typeId = 1;

  @override
  Airport read(BinaryReader reader) {
    final icao = reader.readString();
    final iata = reader.readString();
    final name = reader.readString();
    final city = reader.readString();
    final state = reader.readString();
    final country = reader.readString();
    final elevation = reader.readInt();
    final lat = reader.readDouble();
    final lon = reader.readDouble();
    final tz = reader.readString();

    return Airport(
        icao: icao,
        iata: iata,
        name: name,
        city: city,
        state: state,
        country: country,
        elevation: elevation,
        lat: lat,
        lon: lon,
        tz: tz
     );
  }

  @override
  void write(BinaryWriter writer, Airport obj) {
    writer.writeString(obj.icao ?? "");
    writer.writeString(obj.iata ?? "");
    writer.writeString(obj.name ?? "");
    writer.writeString(obj.city ?? "");
    writer.writeString(obj.state ?? "");
    writer.writeString(obj.country ?? "");
    writer.writeInt(obj.elevation ?? 0);
    writer.writeDouble(obj.lat);
    writer.writeDouble(obj.lon);
    writer.writeString(obj.tz ?? "");

  }
}
