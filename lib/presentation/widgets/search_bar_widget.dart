
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
