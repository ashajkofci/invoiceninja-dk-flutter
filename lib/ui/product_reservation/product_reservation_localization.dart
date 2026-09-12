import 'package:flutter/material.dart';

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
  'currentStatus': 'Current rental status',
  'startField': 'Reservation start date field',
  'endField': 'Reservation end date field',
  'statusField': 'Rental status field',
  'selectField': 'Select an invoice custom field',
  'visibleStatuses': 'Visible calendar statuses and colors',
  'statusValue': 'Status value (for example: New rental invoice)',
  'addStatus': 'Add status',
  'remove': 'Remove',
  'overbooked': 'Overbooked',
  'invoice': 'Invoice',
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
  'currentStatus': 'État de location actuel',
  'startField': 'Champ de date de début de réservation',
  'endField': 'Champ de date de fin de réservation',
  'statusField': 'Champ du statut de location',
  'selectField': 'Sélectionner un champ personnalisé de facture',
  'visibleStatuses': 'Statuts visibles dans le calendrier et couleurs',
  'statusValue': 'Valeur du statut (par exemple : Nouvelle location)',
  'addStatus': 'Ajouter un statut',
  'remove': 'Supprimer',
  'overbooked': 'Surréservé',
  'invoice': 'Facture',
};

String reservationText(BuildContext context, String key) {
  final french = Localizations.localeOf(context).languageCode == 'fr';
  return (french ? _french : _english)[key] ?? key;
}
