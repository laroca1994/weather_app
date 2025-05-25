import 'package:flutter/material.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:wheater_app/core/constants/api_keys.dart';

class GooglePlacesSearchBar extends StatelessWidget {

  const GooglePlacesSearchBar({required this.onPlaceSelected, super.key});
  final Function({required String cityName, required String country})
  onPlaceSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GooglePlaceAutoCompleteTextField(
        textEditingController:
            TextEditingController(), // You might want to manage this
        googleAPIKey: ApiKeys.googlePlacesApiKey,
        inputDecoration: InputDecoration(
          hintText: 'Search your location',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25.0)),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
        ),
        debounceTime: 400,
        getPlaceDetailWithLatLng: (prediction) {
          // This gives full place details
          debugPrint('placeDetails ${prediction.lng}');
        },
        itemClick: (prediction) {
          if (prediction.description != null) {
            // Usually description is "City, Country" or "Place, City, Country"
            // We need to extract the city name. This might need refinement.
            final String cityName = prediction.description!.split(',').first.trim();
            final String country = prediction.description!.split(',').last.trim();
            onPlaceSelected(cityName: cityName, country: country);
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
