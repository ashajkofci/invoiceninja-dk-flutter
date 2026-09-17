import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:invoiceninja_flutter/utils/localization.dart';

const _english = <String, String>{
  'calendar': 'Reservation calendar',
  'today': 'Today',
  'product': 'Product',
  'allProducts': 'All products',
  'stockPeriod': 'Stock during this period',
  'stock': 'in stock',
  'reserved': 'reserved',
  'available': 'available',
  'notTracked': 'Stock not set — availability is not calculated',
  'details': 'Reservation details',
  'noReservations': 'No reservations in this period',
  'noCurrentReservations': 'No current reservations',
  'noCurrentOrFutureReservations': 'No current or future tracked reservations',
  'currentStatus': 'Current rental status',
  'reservationTracking': 'Reservation tracking',
  'reservationTrackingHelp':
      'Keep product stock as total capacity and calculate availability from dated invoices.',
  'startField': 'Reservation start date field',
  'endField': 'Reservation end date field',
  'statusField': 'Rental status field',
  'selectField': 'Select an invoice custom field',
  'visibleStatuses': 'Visible calendar statuses and colors',
  'overrideEndDate': 'Keep reservation active after its end date',
  'statusValue': 'Status value (for example: New rental invoice)',
  'addStatus': 'Add status',
  'remove': 'Remove',
  'overbooked': 'Overbooked',
  'invoice': 'Invoice',
  'unableOpenInvoice': 'Unable to open the invoice',
  'rentalTimeCoefficients': 'Rental time coefficients',
  'timeCoefficientHelp':
      'Apply a named multiplier before tax to invoice and quote product lines.',
  'addTimeCoefficient': 'Add time coefficient',
  'editTimeCoefficient': 'Edit time coefficient',
  'timeCoefficientName': 'Time coefficient name',
  'timeCoefficient': 'Time coefficient',
  'name': 'Name',
  'coefficient': 'Coefficient',
  'standard': 'Standard',
  'cancel': 'Cancel',
  'save': 'Save',
  'history': 'Rental history',
  'statistics': 'Statistics',
  'totalRentals': 'Total rentals',
  'totalDays': 'Total rental days',
  'averageDays': 'Average rental days',
  'totalQuantity': 'Total quantity',
  'totalPrice': 'Total rental price',
  'averagePrice': 'Average rental price',
  'yearlyUsage': 'Rentals by year',
  'rentals': 'rentals',
  'client': 'Client',
  'quantity': 'Quantity',
  'unitPrice': 'Unit price',
  'noRentalHistory': 'No rental history for this product',
  'unableLoadHistory': 'Unable to load rental history',
  'retry': 'Retry',
};

const _french = <String, String>{
  'calendar': 'Calendrier des réservations',
  'today': 'Aujourd’hui',
  'product': 'Produit',
  'allProducts': 'Tous les produits',
  'stockPeriod': 'Stock pendant cette période',
  'stock': 'en stock',
  'reserved': 'réservé',
  'available': 'disponible',
  'notTracked': 'Stock non défini — la disponibilité n’est pas calculée',
  'details': 'Détails des réservations',
  'noReservations': 'Aucune réservation pendant cette période',
  'noCurrentReservations': 'Aucune réservation en cours',
  'noCurrentOrFutureReservations':
      'Aucune réservation actuelle ou future avec stock suivi',
  'currentStatus': 'État de location actuel',
  'reservationTracking': 'Suivi des réservations',
  'reservationTrackingHelp':
      'Conserver le stock du produit comme capacité totale et calculer la disponibilité selon les factures datées.',
  'startField': 'Champ de date de début de réservation',
  'endField': 'Champ de date de fin de réservation',
  'statusField': 'Champ du statut de location',
  'selectField': 'Sélectionner un champ personnalisé de facture',
  'visibleStatuses': 'Statuts visibles dans le calendrier et couleurs',
  'overrideEndDate': 'Maintenir la réservation active après sa date de fin',
  'statusValue': 'Valeur du statut (par exemple : Nouvelle location)',
  'addStatus': 'Ajouter un statut',
  'remove': 'Supprimer',
  'overbooked': 'Surréservé',
  'invoice': 'Facture',
  'unableOpenInvoice': 'Impossible d’ouvrir la facture',
  'rentalTimeCoefficients': 'Coefficients de durée de location',
  'timeCoefficientHelp':
      'Appliquer un multiplicateur nommé avant taxes aux lignes de produits des factures et devis.',
  'addTimeCoefficient': 'Ajouter un coefficient de durée',
  'editTimeCoefficient': 'Modifier le coefficient de durée',
  'timeCoefficientName': 'Nom du coefficient de durée',
  'timeCoefficient': 'Coefficient de durée',
  'name': 'Nom',
  'coefficient': 'Coefficient',
  'standard': 'Standard',
  'cancel': 'Annuler',
  'save': 'Enregistrer',
  'history': 'Historique des locations',
  'statistics': 'Statistiques',
  'totalRentals': 'Total des locations',
  'totalDays': 'Total des jours de location',
  'averageDays': 'Durée moyenne de location',
  'totalQuantity': 'Quantité totale',
  'totalPrice': 'Prix total des locations',
  'averagePrice': 'Prix moyen des locations',
  'yearlyUsage': 'Locations par année',
  'rentals': 'locations',
  'client': 'Client',
  'quantity': 'Quantité',
  'unitPrice': 'Prix unitaire',
  'noRentalHistory': 'Aucun historique de location pour ce produit',
  'unableLoadHistory': 'Impossible de charger l’historique des locations',
  'retry': 'Réessayer',
};

String reservationText(BuildContext context, String key) {
  final french = (AppLocalization.of(context)?.locale.languageCode ??
          Localizations.localeOf(context).languageCode) ==
      'fr';
  return (french ? _french : _english)[key] ?? key;
}

List<Map<String, dynamic>> decodeTimeCoefficients(String value) {
  try {
    return (jsonDecode(value) as List)
        .map((item) => Map<String, dynamic>.from(item as Map))
        .toList();
  } catch (_) {
    return [];
  }
}
