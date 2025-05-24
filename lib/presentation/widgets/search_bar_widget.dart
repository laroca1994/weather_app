// import 'package:flutter/material.dart';

// class CitySearchBar extends StatefulWidget {
//   final Function(String cityName) onSearch;

//   const CitySearchBar({super.key, required this.onSearch});

//   @override
//   State<CitySearchBar> createState() => _CitySearchBarState();
// }

// class _CitySearchBarState extends State<CitySearchBar> {
//   final _textController = TextEditingController();

//   @override
//   void dispose() {
//     _textController.dispose();
//     super.dispose();
//   }

//   void _submit() {
//     if (_textController.text.isNotEmpty) {
//       widget.onSearch(_textController.text);
//       // _textController.clear(); // Optional: clear after search
//       FocusScope.of(context).unfocus(); // Hide keyboard
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: TextField(
//         controller: _textController,
//         decoration: InputDecoration(
//           hintText: 'Buscar ciudad...',
//           border: OutlineInputBorder(borderRadius: BorderRadius.circular(25.0)),
//           suffixIcon: IconButton(
//             icon: const Icon(Icons.search),
//             onPressed: _submit,
//           ),
//           contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
//         ),
//         onSubmitted: (_) => _submit(),
//       ),
//     );
//   }
// }

// TODO: Implement Google Places Search Bar.
// For google_places_flutter package:

import 'package:flutter/material.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:wheater_app/core/constants/api_keys.dart';

class GooglePlacesSearchBar extends StatelessWidget {
  final Function(String cityName) onPlaceSelected;

  const GooglePlacesSearchBar({super.key, required this.onPlaceSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GooglePlaceAutoCompleteTextField(
        textEditingController: TextEditingController(), // You might want to manage this
        googleAPIKey: ApiKeys.googlePlacesApiKey,
        inputDecoration: InputDecoration(
          hintText: "Search your location",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25.0)),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
        ),
        debounceTime: 400,
        countries: const ["ar", "uy", "br", "de", "gb"], // Example countries
        isLatLngRequired: false, // We only need city name for OpenWeatherMap
        getPlaceDetailWithLatLng: (prediction) {
          // This gives full place details
          // print("placeDetails " + prediction.lng.toString());
        },
        itemClick: (prediction) {
          if (prediction.description != null) {
            // Usually description is "City, Country" or "Place, City, Country"
            // We need to extract the city name. This might need refinement.
            String cityName = prediction.description!.split(',').first.trim();
            onPlaceSelected(cityName);
            // Clear the text field or close search UI
            FocusScope.of(context).unfocus();
          }
        },
        // Optional:
        // isCrossBtnShown: true,
        // ... other properties
      ),
    );
  }
}
