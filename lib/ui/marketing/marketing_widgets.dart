import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Workspace-only copy stays with the native UI; shared API labels remain usable.
String marketingUxText(BuildContext context, String key) =>
    _copy[Localizations.localeOf(context).languageCode]?[key] ??
    _copy['en']?[key] ??
    key;

const _copy = <String, Map<String, String>>{
  'en': {
    'details': 'Opportunity details',
    'planning': 'Planning & notes',
    'sending_preferences': 'Email & consent',
    'more_actions': 'More actions',
    'move_stage': 'Change stage',
    'close_stage_confirm':
        'Closing this opportunity cancels its pending follow-ups.',
    'clear_filters': 'Clear filters',
    'no_results': 'No matching records',
    'pipeline_empty_help':
        'Start from a quote to fill in the customer and value, or create an opportunity from scratch.',
    'due_empty_help':
        'You’re up to date. Open all activities to plan your next follow-up.',
    'followup_empty_help': 'Every open opportunity has a next action planned.',
    'required': 'Required',
    'check_fields': 'Check the required fields before saving.',
    'local_due_at': 'Due date & time',
    'local_time': 'Shown in your local time zone',
    'today': 'Today',
    'tomorrow': 'Tomorrow',
    'overdue': 'Overdue',
    'closed': 'Closed',
    'sequence_help':
        'Creates planned activities. Review the steps and dates before starting.',
    'manual_sequence_help':
        'Emails are planned for manual sending. Nothing is sent when you start the sequence.',
    'automatic_sequence_help':
        'Automatic emails follow the company sending rules and this opportunity’s email preference.',
    'company_automatic_off':
        'Company automatic sending is off. Emails will need to be sent manually.',
    'discard_changes': 'Discard unsaved changes?',
    'keep_editing': 'Keep editing',
    'discard': 'Discard',
    'select_option': 'Choose an option',
    'no_options': 'No matching options',
    'cancel_activity_confirm': 'Cancel this planned follow-up?',
    'day_offset': 'days after start',
    'invalid_number': 'Enter a valid amount of zero or more',
  },
  'fr': {
    'details': 'Détails de l’opportunité',
    'planning': 'Planification et notes',
    'sending_preferences': 'E-mails et consentement',
    'more_actions': 'Autres actions',
    'move_stage': 'Changer d’étape',
    'close_stage_confirm':
        'Clôturer cette opportunité annule ses suivis en attente.',
    'clear_filters': 'Effacer les filtres',
    'no_results': 'Aucun résultat',
    'pipeline_empty_help':
        'Partez d’un devis pour préremplir le client et le montant, ou créez une opportunité.',
    'due_empty_help':
        'Vous êtes à jour. Consultez toutes les activités pour planifier le prochain suivi.',
    'followup_empty_help':
        'Chaque opportunité ouverte a une prochaine action planifiée.',
    'required': 'Obligatoire',
    'check_fields': 'Vérifiez les champs obligatoires avant d’enregistrer.',
    'local_due_at': 'Date et heure d’échéance',
    'local_time': 'Affichées dans votre fuseau horaire local',
    'today': 'Aujourd’hui',
    'tomorrow': 'Demain',
    'overdue': 'En retard',
    'closed': 'Clôturée',
    'sequence_help':
        'Crée des activités planifiées. Vérifiez les étapes et les dates avant de commencer.',
    'manual_sequence_help':
        'Les e-mails seront envoyés manuellement. Démarrer la séquence n’envoie aucun message.',
    'automatic_sequence_help':
        'Les e-mails automatiques respectent les règles de l’entreprise et les préférences de cette opportunité.',
    'company_automatic_off':
        'L’envoi automatique de l’entreprise est désactivé. Les e-mails devront être envoyés manuellement.',
    'discard_changes': 'Abandonner les modifications ?',
    'keep_editing': 'Continuer à modifier',
    'discard': 'Abandonner',
    'select_option': 'Choisir une option',
    'no_options': 'Aucune option correspondante',
    'cancel_activity_confirm': 'Annuler ce suivi planifié ?',
    'day_offset': 'jours après le début',
    'invalid_number': 'Saisissez un montant valide, positif ou nul',
  },
  'de': {
    'details': 'Details der Verkaufschance',
    'planning': 'Planung & Notizen',
    'sending_preferences': 'E-Mails & Einwilligung',
    'more_actions': 'Weitere Aktionen',
    'move_stage': 'Phase ändern',
    'close_stage_confirm':
        'Beim Abschließen dieser Verkaufschance werden ausstehende Folgeaktionen abgebrochen.',
    'clear_filters': 'Filter zurücksetzen',
    'no_results': 'Keine passenden Einträge',
    'pipeline_empty_help':
        'Beginnen Sie mit einem Angebot, um Kunde und Wert zu übernehmen, oder erstellen Sie eine Verkaufschance.',
    'due_empty_help':
        'Alles erledigt. Öffnen Sie alle Aktivitäten, um die nächste Folgeaktion zu planen.',
    'followup_empty_help':
        'Für jede offene Verkaufschance ist eine nächste Aktion geplant.',
    'required': 'Erforderlich',
    'check_fields': 'Prüfen Sie vor dem Speichern die Pflichtfelder.',
    'local_due_at': 'Fälligkeitsdatum & Uhrzeit',
    'local_time': 'Anzeige in Ihrer lokalen Zeitzone',
    'today': 'Heute',
    'tomorrow': 'Morgen',
    'overdue': 'Überfällig',
    'closed': 'Abgeschlossen',
    'sequence_help':
        'Erstellt geplante Aktivitäten. Prüfen Sie vor dem Start die Schritte und Termine.',
    'manual_sequence_help':
        'E-Mails werden für den manuellen Versand geplant. Beim Start wird keine Nachricht gesendet.',
    'automatic_sequence_help':
        'Automatische E-Mails folgen den Versandregeln der Firma und den Einstellungen dieser Verkaufschance.',
    'company_automatic_off':
        'Der automatische Versand der Firma ist deaktiviert. E-Mails müssen manuell gesendet werden.',
    'discard_changes': 'Ungespeicherte Änderungen verwerfen?',
    'keep_editing': 'Weiter bearbeiten',
    'discard': 'Verwerfen',
    'select_option': 'Option auswählen',
    'no_options': 'Keine passenden Optionen',
    'cancel_activity_confirm': 'Diese geplante Folgeaktion abbrechen?',
    'day_offset': 'Tage nach dem Start',
    'invalid_number': 'Geben Sie einen gültigen Betrag ab null ein',
  },
};

// The API accepts and returns UTC, sometimes without an explicit zone suffix.
DateTime? marketingUtcDate(dynamic value) {
  final raw = (value ?? '').toString();
  if (raw.isEmpty) {
    return null;
  }
  final parsed = DateTime.tryParse(raw);
  if (parsed == null) {
    return null;
  }
  return parsed.isUtc
      ? parsed
      : DateTime.utc(parsed.year, parsed.month, parsed.day, parsed.hour,
          parsed.minute, parsed.second, parsed.millisecond);
}

String marketingDateLabel(BuildContext context, dynamic value,
    {DateTime? now, bool relative = true}) {
  final date = marketingUtcDate(value)?.toLocal();
  if (date == null) {
    return '—';
  }
  final localizations = MaterialLocalizations.of(context);
  final current = (now ?? DateTime.now()).toLocal();
  final day = DateTime(date.year, date.month, date.day);
  final today = DateTime(current.year, current.month, current.day);
  final label = relative && day == today
      ? marketingUxText(context, 'today')
      : relative && day == DateTime(today.year, today.month, today.day + 1)
          ? marketingUxText(context, 'tomorrow')
          : localizations.formatMediumDate(date);
  return '$label · ${localizations.formatTimeOfDay(TimeOfDay.fromDateTime(date), alwaysUse24HourFormat: MediaQuery.alwaysUse24HourFormatOf(context))}';
}

String marketingAmount(BuildContext context, dynamic value) {
  final amount = num.tryParse('$value');
  return amount == null
      ? '$value'
      : (NumberFormat.decimalPattern(Localizations.localeOf(context).toString())
            ..maximumFractionDigits = 2)
          .format(amount);
}

String marketingPriceInput(dynamic value) {
  final amount = num.tryParse('$value');
  return amount == null || !amount.isFinite
      ? '$value'
      : NumberFormat('0.##', 'en').format(amount);
}

class MarketingDueLabel extends StatelessWidget {
  const MarketingDueLabel(
      {super.key, required this.value, this.pending = true});
  final dynamic value;
  final bool pending;

  @override
  Widget build(BuildContext context) {
    final overdue = pending &&
        (marketingUtcDate(value)?.isBefore(DateTime.now().toUtc()) ?? false);
    final label = marketingDateLabel(context, value);
    return Text(
      overdue ? '${marketingUxText(context, 'overdue')} · $label' : label,
      style: TextStyle(
          color: overdue ? Theme.of(context).colorScheme.error : null),
    );
  }
}

/// A searchable picker for large customer, quote and template collections.
class MarketingOptionField extends StatelessWidget {
  const MarketingOptionField({
    super.key,
    required this.label,
    required this.value,
    required this.options,
    required this.onChanged,
    this.emptyLabel = '—',
    this.validator,
  });
  final String label, value, emptyLabel;
  final List<dynamic> options;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) => FormField<String>(
        initialValue: value,
        validator: validator,
        builder: (field) {
          final matches = options.where((o) => '${o['id']}' == value);
          final name =
              matches.isEmpty ? emptyLabel : '${matches.first['name']}';
          return Semantics(
            button: true,
            label: label,
            value: name,
            child: InkWell(
              onTap: onChanged == null
                  ? null
                  : () async {
                      final next = await showDialog<String>(
                        context: context,
                        builder: (_) => _MarketingOptionDialog(
                          title: label,
                          value: value,
                          options: options,
                          emptyLabel: emptyLabel,
                        ),
                      );
                      if (next != null && context.mounted) {
                        field.didChange(next);
                        onChanged!(next);
                      }
                    },
              child: InputDecorator(
                decoration: InputDecoration(
                  labelText: label,
                  enabled: onChanged != null,
                  errorText: field.errorText,
                  suffixIcon: const Icon(Icons.arrow_drop_down),
                ),
                child: Text(name, maxLines: 1, overflow: TextOverflow.ellipsis),
              ),
            ),
          );
        },
      );
}

class _MarketingOptionDialog extends StatefulWidget {
  const _MarketingOptionDialog({
    required this.title,
    required this.value,
    required this.options,
    required this.emptyLabel,
  });
  final String title, value, emptyLabel;
  final List<dynamic> options;
  @override
  State<_MarketingOptionDialog> createState() => _MarketingOptionDialogState();
}

class _MarketingOptionDialogState extends State<_MarketingOptionDialog> {
  String search = '';
  @override
  Widget build(BuildContext context) {
    final matches = widget.options
        .where((o) => '${o['name']}'.toLowerCase().contains(search))
        .toList();
    return AlertDialog(
      title: Text(widget.title),
      content: SizedBox(
        width: 520,
        height: MediaQuery.sizeOf(context).height * .5,
        child: Column(children: [
          TextField(
            autofocus: true,
            decoration: InputDecoration(
                labelText: MaterialLocalizations.of(context).searchFieldLabel,
                prefixIcon: const Icon(Icons.search)),
            onChanged: (value) =>
                setState(() => search = value.trim().toLowerCase()),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView(children: [
              if (search.isEmpty)
                ListTile(
                  title: Text(widget.emptyLabel),
                  selected: widget.value.isEmpty,
                  onTap: () => Navigator.pop(context, ''),
                ),
              for (final option in matches)
                ListTile(
                  title: Text('${option['name']}'),
                  selected: '${option['id']}' == widget.value,
                  trailing: '${option['id']}' == widget.value
                      ? const Icon(Icons.check)
                      : null,
                  onTap: () => Navigator.pop(context, '${option['id']}'),
                ),
              if (matches.isEmpty)
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(marketingUxText(context, 'no_options')),
                ),
            ]),
          ),
        ]),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(MaterialLocalizations.of(context).cancelButtonLabel),
        ),
      ],
    );
  }
}
