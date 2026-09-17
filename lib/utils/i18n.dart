// Project imports:
import 'package:invoiceninja_flutter/utils/strings.dart';

abstract class LocaleCodeAware {
  LocaleCodeAware(this.localeCode);

  final String localeCode;

  String get baseLocaleCode => localeCode.split('_').first;
}

///
/// It provides localization strings to be statically used via getters
///
/// It should be used by a [LocaleCodeAware] to get the i18n strings for
/// a specified locale.
mixin LocalizationsProvider on LocaleCodeAware {
  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      // STARTER: lang key - do not remove comment
      'invoice_outstanding_tasks': 'Invoice Outstanding Tasks',
      'price_per_unit_pro_rata': 'Price per unit (pro rata)',
      'payment_schedule': 'Payment Schedule',
      'auto_send': 'Auto Send',
      'include_project_tasks': 'Include Project Tasks',
      'net_cost': 'Net Cost',
      'skip_automatic_emails': 'Skip Automatic Emails',
      'forward_email': 'Forward Email',
      'cc_only': 'CC Only',
      'activity_149': ':user emailed credit :credit for :client to :contact',
      'activity_150': 'Account deleted :notes',
      'activity_154':
          'E-Invoice :invoice for :client sent to AEAT successfully',
      'activity_155':
          'E-Invoice :invoice for :client failed to send to AEAT :notes',
      'activity_156':
          'Invoice cancellation for :invoice sent to AEAT successfully',
      'activity_157':
          'Invoice cancellation for :invoice failed to send to AEAT :notes',
      'activity_158': 'Quote :quote was rejected by :client :notes',
      'rejected': 'Rejected',
      'quote_rejected': 'Quote Rejected',
      'disable_recurring_payment_notification':
          'Disable Recurring Payment Notification',
      'disable_recurring_payment_notification_help':
          'Successful recurring invoice payment notifications will not be sent.',
      'e_invoice_received_notification': 'E-Invoice Received Notification',
      'e_invoice_received_notification_help':
          'Send an email when an e-invoice has been received',
      'empty': 'Empty',
      'location_name': 'Location Name',
      'location_field': 'Location Field',
      'activity_151': 'Client :notes merged into :client by :user',
      'activity_152': 'Vendor :notes merged into :vendor by :user',
      'activity_153': 'Client :notes purged by :user',
      'secret_key': 'Secret Key',
      'access_key': 'Access Key',
      'from_address': 'From Address',
      'topic_arn': 'Topic ARN',
      'replaced': 'Replaced',
      'tax_names': 'Tax Names',
      'location': 'Location',
      'is_shipping': 'Is Shipping',
      'deleted_location': 'Successfully deleted location',
      'added_location': 'Successfully added location',
      'updated_location': 'Successfully upated location',
      'edit_location': 'Edit Location',
      'add_location': 'Add Location',
      'locations': 'Locations',
      'preference_product_notes_for_html_view':
          'Display HTML version of entity when viewing on mobile',
      'preference_product_notes_for_html_view_help':
          'For improved visualization, displays a HTML version of the invoice/quote when viewing on mobile',
      'in_stock_quantity': 'In Stock Quantity',
      'send_emails': 'Send Emails',
      'send_emails_permission': 'Allow user to send emails',
      'enable_client_profile_update': 'Allow clients to update their profile',
      'enable_client_profile_update_help':
          'Allow clients to update their profile information from the client portal',
      'participant': 'Participant',
      'merged_vendors': 'Successfully merged vendors',
      'activity_146': 'E-Invoice :invoice for :client was delivered',
      'activity_147': 'E-Invoice :invoice for :client failed to send',
      'activity_148': 'E-Exepnse :expense created',
      'payment_failed': 'Payment Failed',
      'activity_141': 'User :user entered note :notes',
      'activity_142': 'Quote :number reminder 1 sent',
      'activity_143': 'Auto Bill succeeded for invoice :invoice',
      'activity_144': 'Auto Bill failed for invoice :invoice',
      'activity_145': 'E-Invoice :invoice for :client was sent',
      'ssl_host_override': 'SSL Host Override',
      'upload_logo_short': 'Upload Logo',
      'show_pdfhtml_on_mobile_help':
          'For improved visualization, displays a HTML version of the invoice/quote when viewing on mobile.',
      'accept_purchase_order': 'Accept Purchase Order',
      'one_page_checkout': 'One-Page Checkout',
      'one_page_checkout_help': 'Enable the new single page payment flow',
      'applies_to': 'Applies To',
      'purchase_order_items': 'Purchase Order Items',
      'assigned_group': 'Successfully assigned group',
      'assign_group': 'Assign Group',
      'merge_to_pdf': 'Merge to PDF',
      'emails': 'Emails',
      'latest_requires_php_version':
          'Note: the latest version requires PHP :version',
      'quote_reminder1': 'First Quote Reminder',
      'before_valid_until': 'Before the valid until',
      'after_valid_until': 'After the valid until',
      'after_quote_date': 'After the quote date',
      'remind_quote': 'Remind Quote',
      'task_assigned_notification': 'Task Assigned Notification',
      'task_assigned_notification_help':
          'Send an email when a task is assigned',
      'invoices_locked_end_of_month':
          'Invoices are locked at the end of the month',
      'end_of_month': 'End of Month',
      'referral_url': 'Referral URL',
      'referral_program': 'Referral Program',
      'comment': 'Comment',
      'add_comment': 'Add Comment',
      'added_comment': 'Successfully saved comment',
      'disconnected': 'Disconnected',
      'reconnect': 'Reconnect',
      'e_invoice_settings': 'E-Invoice Settings',
      'calculate': 'Calculate',
      'sum': 'Sum',
      'money': 'Money',
      'time': 'Time',
      'format': 'Format',
      'web_app': 'Web App',
      'desktop_app': 'Desktop App',
      'invoice_net_amount': 'Invoice Net Amount',
      'round_to_seconds': 'Round To Seconds',
      '1_minute': '1 Minute',
      '5_minutes': '5 Minutes',
      '15_minutes': '15 Minutes',
      '30_minutes': '30 Minutes',
      '1_hour': '1 Hour',
      '1_day': '1 Day',
      'round_tasks': 'Round Tasks',
      'round_tasks_help': 'Round time intervals when saving tasks',
      'direction': 'Direction',
      'round_up': 'Round Up',
      'round_down': 'Round Down',
      'task_round_to_nearest': 'Round To Nearest',
      'activity_139': 'Expense :expense notification sent to :contact',
      'activity_140': 'Statement sent to :client',
      'bulk_updated': 'Successfully updated data',
      'bulk_update': 'Bulk Update',
      'advanced_cards': 'Advanced Cards',
      'always_show_required_fields': 'Always Show Required Fields',
      'always_show_required_fields_help':
          'Show required fields regardless if they are filled or not',
      'flutter_web_warning':
          'We recommend using the new web app or the desktop app for the best performance',
      'rappen_rounding': 'Rappen Rounding',
      'rappen_rounding_help': 'Round amount to 5 cents',
      'check_credentials': 'Check Credentials',
      'valid_credentials': 'Credentials are valid',
      'invalid_credentials': 'Credentials are not valid',
      'e_quote': 'E-Quote',
      'e_credit': 'E-Credit',
      'e_purchase_order': 'E-Purchase Order',
      'valid_vat_number': 'Valid VAT Number',
      'use_available_payments': 'Use Available Payments',
      'test_email_sent': 'Successfully sent email',
      'send_test_email': 'Send Test Email',
      'gateway_type': 'Gateway Type',
      'please_select_an_invoice_or_credit':
          'Please select an invoice or credit',
      'mobile_version': 'Mobile Version',
      'venmo': 'Venmo',
      'mercado_pago': 'Mercado Pago',
      'my_bank': 'MyBank',
      'pay_later': 'Pay Later',
      'email_report': 'Email Report',
      'host': 'Host',
      'port': 'Port',
      'encryption': 'Encryption',
      'local_domain': 'Local Domain',
      'verify_peer': 'Verify Peer',
      'username': 'Username',
      'nordigen_help':
          'Note: connecting an account requires a GoCardless/Nordigen API key',
      'participant_name': 'Participant Name',
      'yodlee_regions': 'Regions: USA, UK, Australia & India',
      'nordigen_regions': 'Regions: Europe & UK',
      'select_provider': 'Select Provider',
      'payment_type_credit': 'Payment Type Credit',
      'payment_type_debit': 'Payment Type Debit',
      'send_emails_to': 'Send Emails To',
      'primary_contact': 'Primary Contact',
      'all_contacts': 'All Contacts',
      'insert_below': 'Insert Below',
      'ar_detailed': 'Accounts Receivable Detailed',
      'ar_summary': 'Accounts Receivable Summary',
      'client_sales': 'Client Sales',
      'tax_summary': 'Tax Summary',
      'user_sales': 'User Sales',
      'run_template': 'Run Template',
      'task_extension_banner':
          'Install the Chrome extension to manage tasks in your browser',
      'watch_video': 'Watch Video',
      'view_extension': 'View Extension',
      'reactivate_email': 'Reactivate Email',
      'email_reactivated': 'Successfully reactivated email',
      'template_help': 'Enable using the design as a template',
      'delivery_note_design': 'Delivery Note Design',
      'statement_design': 'Statement Design',
      'payment_receipt_design': 'Payment Receipt Design',
      'payment_refund_design': 'Payment Refund Design',
      'quarter': 'Quarter',
      'item_description': 'Item Description',
      'task_item': 'Task Item',
      'record_state': 'Record State',
      'last_login': 'Last Login',
      'save_files_to_this_folder': 'Save files to this folder',
      'downloads_folder': 'Downloads Folder',
      'total_invoiced_quotes': 'Invoiced Quotes',
      'total_invoice_paid_quotes': 'Invoice Paid Quotes',
      'downloads_folder_does_not_exist':
          'The downloads folder does not exist :value',
      'user_logged_in_notification': 'User Logged in Notification',
      'user_logged_in_notification_help':
          'Send an email when logging in from a new location',
      'client_contact': 'Client Contact',
      'expense_status_4': 'Unpaid',
      'expense_status_5': 'Paid',
      'recurring': 'Recurring',
      'ziptax_help':
          'Note: this feature requires a Zip-Tax API key to lookup US sales tax by address',
      'cache_data': 'Cache Data',
      'unknown': 'Unknown',
      'webhook_failure': 'Webhook Failure',
      'email_opened': 'Email Opened',
      'email_delivered': 'Email Delivered',
      'log': 'Log',
      'individual': 'Individual',
      'partnership': 'Partnership',
      'trust': 'Trust',
      'charity': 'Charity',
      'government': 'Government',
      'classification': 'Classification',
      'click_or_drop_files_here': 'Click or drop files here',
      'public': 'Public',
      'private': 'Private',
      'image': 'Image',
      'other': 'Other',
      'hash': 'Hash',
      'linked_to': 'Linked To',
      'file_saved_in_path': 'The file has been saved to :path',
      'unlinked_transactions': 'Successfully unlinked :count transactions',
      'unlinked_transaction': 'Successfully unlinked transaction',
      'unlink': 'Unlink',
      'view_dashboard_permission':
          'Allow user to access the dashboard, data is limited to available permissions',
      'is_tax_exempt': 'Tax Exempt',
      'district': 'District',
      'region': 'Region',
      'county': 'County',
      'tax_details': 'Tax Details',
      'activity_10_online':
          ':contact entered payment :payment for invoice :invoice for :client',
      'activity_10_manual':
          ':user entered payment :payment for invoice :invoice for :client',
      'default_payment_type': 'Default Payment Type',
      'admin_initiated_payments': 'Admin Initiated Payments',
      'admin_initiated_payments_help':
          'Support entering a payment in the admin portal without an invoice',
      'use_mobile_to_manage_plan':
          'Use your phone subscription settings to manage your plan',
      'show_task_billable': 'Show Task Billable',
      'credit_item': 'Credit Item',
      'files': 'Files',
      'camera': 'Camera',
      'gallery': 'Gallery',
      'email_count_invoices': 'Email :count invoices',
      'project_location': 'Project Location',
      'invoice_task_item_description': 'Invoice Task Item Description',
      'invoice_task_item_description_help':
          'Add the item description to the invoice line items',
      'next_send_time': 'Next Send Time',
      'uploaded_certificate': 'Successfully uploaded certificate',
      'certificate_set': 'Certificate set',
      'certificate_not_set': 'Certificate not set',
      'passphrase_set': 'Passphrase set',
      'passphrase_not_set': 'Passphrase not set',
      'upload_certificate': 'Upload Certificate',
      'certificate_passphrase': 'Certificate Passphrase',
      'rename': 'Rename',
      'renamed_document': 'Successfully renamed document',
      'e_invoice': 'E-Invoice',
      'actual_delivery_date': 'Actual Delivery Date',
      'act_as_sender': 'Act as Sender',
      'act_as_receiver': 'Act as Receiver',
      'payment_means': 'Payment Means',
      'account_holder': 'Account Holder',
      'connected': 'Connected',
      'setup': 'Setup',
      'business': 'Business',
      'code': 'Code',
      'additional_tax_identifiers': 'Additional Tax Identifiers',
      'add_tax_identifier': 'Add Tax Identifier',
      'payer_bank_account': 'Payer Bank Account',
      'bsb_sort': 'BSB/Sort Code',
      'card_type': 'Card Type',
      'card_number': 'Card Number',
      'card_holder': 'Card Holder',
      'tax_authority_authorization_step_1':
          'Navigate to the AEAT (Agencia Tributaria) website',
      'tax_authority_authorization_step_2':
          'Log in with your digital certificate or Cl@ve PIN',
      'tax_authority_authorization_step_3':
          'Navigate to the VERIFACTU authorization section',
      'tax_authority_authorization_step_4':
          'Enter the authorized third-party details',
      'tax_authority_authorization_step_5': 'Submit the authorization request',
      'tax_authority_authorization_step_6':
          'You will receive confirmation from AEAT once processed',
      'light_dark_mode': 'Light/Dark Mode',
      'activities': 'Activities',
      'routing_id': 'Routing ID',
      'enable_e_invoice': 'Enable E-Invoice',
      'e_invoice_type': 'E-Invoice Type',
      'e_quote_type': 'E-Quote Type',
      'reduced_tax': 'Reduced',
      'override_tax': 'Override',
      'zero_rated': 'Zero Rated',
      'reverse_tax': 'Reverse',
      'updated_tax_category': 'Successfully updated the tax category',
      'updated_tax_categories': 'Successfully updated the tax categories',
      'set_tax_category': 'Set Tax Category',
      'payment_manual': 'Payment Manual',
      'tax_category': 'Tax Category',
      'physical_goods': 'Physical Goods',
      'digital_products': 'Digital Products',
      'services': 'Services',
      'shipping': 'Shipping',
      'tax_exempt': 'Exempt',
      'reduced_rate': 'Reduced Rate',
      'tax_all': 'Tax All',
      'tax_selected': 'Tax Selected',
      'version': 'version',
      'seller_subregion': 'Seller Subregion',
      'calculate_taxes': 'Calculate Taxes',
      'calculate_taxes_help':
          'Automatically calculate taxes when saving invoices',
      'admin': 'Admin',
      'owner': 'Owner',
      'link_expenses': 'Link Expenses',
      'converted_client_balance': 'Converted Client Balance',
      'converted_payment_balance': 'Converted Payment Balance',
      'total_hours': 'Total Hours',
      'date_picker_hint': 'Use +days to set the date in the future',
      'browser_pdf_viewer': 'Use Browser PDF Viewer',
      'browser_pdf_viewer_help':
          'Warning: Prevents interacting with app over the PDF',
      'increase_prices': 'Increase Prices',
      'update_prices': 'Update Prices',
      'incresed_prices': 'Successfully queued prices to be increased',
      'updated_prices': 'Successfully queued prices to be updated',
      'bacs': 'Bacs',
      'api_token': 'API Token',
      'api_key': 'API Key',
      'endpoint': 'Endpoint',
      'billable': 'Billable',
      'not_billable': 'Not Billable',
      'allow_billable_task_items': 'Allow Billable Task Items',
      'allow_billable_task_items_help':
          'Enable specifying which task items are billed',
      'show_task_item_description': 'Show Task Item Description',
      'show_task_item_description_help':
          'Enable specifying task item descriptions',
      'email_record': 'Email Record',
      'invoice_product_columns': 'Invoice Product Columns',
      'quote_product_columns': 'Quote Product Columns',
      'minimum_payment_amount': 'Minimum Payment Amount',
      'client_initiated_payments': 'Client Initiated Payments',
      'client_initiated_payments_help':
          'Support entering a payment in the client portal without an invoice',
      'share_invoice_quote_columns': 'Share Invoice/Quote Columns',
      'cc_email': 'CC Email',
      'payment_balance': 'Payment Balance',
      'view_report_permission':
          'Allow user to access the reports, data is limited to available permissions',
      'activity_138': 'Payment :payment was emailed to :contact',
      'one_time_products': 'One-Time Products',
      'optional_one_time_products': 'Optional One-Time Products',
      'required': 'Required',
      'hidden': 'Hidden',
      'payment_links': 'Payment Links',
      'action': 'Action',
      'upgrade_to_paid_plan_to_schedule':
          'Upgrade to a paid plan to create schedules',
      'next_run': 'Next Run',
      'all_clients': 'All Clients',
      'show_aging_table': 'Show Aging Table',
      'show_payments_table': 'Show Payments Table',
      'only_clients_with_invoices': 'Only Clients with Invoices',
      'email_statement': 'Email Statement',
      'once': 'Once',
      'schedule': 'Schedule',
      'schedules': 'Schedules',
      'new_schedule': 'New Schedule',
      'edit_schedule': 'Edit Schedule',
      'created_schedule': 'Successfully created schedule',
      'updated_schedule': 'Successfully updated schedule',
      'archived_schedule': 'Successfully archived schedule',
      'deleted_schedule': 'Successfully deleted schedule',
      'removed_schedule': 'Successfully removed schedule',
      'restored_schedule': 'Successfully restored schedule',
      'search_schedule': 'Search Schedule',
      'search_schedules': 'Search Schedules',

      'archive_payment': 'Archive Payment',
      'archive_invoice': 'Archive Invoice',
      'archive_quote': 'Archive Quote',
      'archive_credit': 'Archive Credit',
      'archive_task': 'Archive Task',
      'archive_client': 'Archive Client',
      'archive_project': 'Archive Project',
      'archive_expense': 'Archive Expense',
      'restore_payment': 'Restore Payment',
      'restore_invoice': 'Restore Invoice',
      'restore_quote': 'Restore Quote',
      'restore_credit': 'Restore Credit',
      'restore_task': 'Restore Task',
      'restore_client': 'Restore Client',
      'restore_project': 'Restore Project',
      'restore_expense': 'Restore Expense',
      'archive_vendor': 'Archive Vendor',
      'restore_vendor': 'Restore Vendor',
      'create_product': 'Create Product',
      'update_product': 'Update Product',
      'delete_product': 'Delete Product',
      'restore_product': 'Restore Product',
      'archive_product': 'Archive Product',
      'create_purchase_order': 'Create Purchase Order',
      'update_purchase_order': 'Update Purchase Order',
      'delete_purchase_order': 'Delete Purchase Order',
      'restore_purchase_order': 'Restore Purchase Order',
      'archive_purchase_order': 'Archive Purchase Order',
      'sent_invoice': 'Sent Invoice',
      'sent_quote': 'Sent Quote',
      'sent_credit': 'Sent Credit',
      'sent_purchase_order': 'Sent Purchase Order',
      'image_url': 'Image URL',
      'max_quantity': 'Max Quantity',
      'test_url': 'Test URL',
      'auto_bill_help_off': 'Option is not shown',
      'auto_bill_help_optin': 'Option is shown but not selected',
      'auto_bill_help_optout': 'Option is shown and selected',
      'auto_bill_help_always': 'Option is not shown',
      'payment_methods': 'Payment Methods',
      'view_all': 'View All',
      'edit_all': 'Edit All',
      'accept_purchase_order_number': 'Accept Purchase Order Number',
      'accept_purchase_order_number_help':
          'Enable clients to provide a PO number when approving a quote',
      'from_email': 'From Email',
      'show_preview': 'Show Preview',
      'show_paid_stamp': 'Show Paid Stamp',
      'show_shipping_address': 'Show Shipping Address',
      'no_documents_to_download':
          'There are no documents in the selected records to download',
      'pixels': 'Pixels',
      'logo_size': 'Logo Size',
      'postal_city': 'Postal/City',
      'failed': 'Failed',
      'client_contacts': 'Client Contacts',
      'sync_from': 'Sync From',
      'inventory_threshold': 'Inventory Threshold',
      'hour': 'Hour',
      'emailed_statement': 'Successfully queued statement to be sent',
      'show_email_footer': 'Show Email Footer',
      'invoice_task_hours': 'Invoice Task Hours',
      'invoice_task_hours_help': 'Add the hours to the invoice line items',
      'auto_bill_standard_invoices': 'Auto Bill Standard Invoices',
      'auto_bill_recurring_invoices': 'Auto Bill Recurring Invoices',
      'email_alignment': 'Email Alignment',
      'pdf_preview_location': 'PDF Preview Location',
      'mailgun': 'Mailgun',
      'postmark': 'Postmark',
      'microsoft': 'Microsoft',
      'click_plus_to_create_record': 'Click + to create a record',
      'last365_days': 'Last 365 Days',
      'import_design': 'Import Design',
      'imported_design': 'Successfully imported design',
      'invalid_design': 'The design is invalid, the :value section is missing',
      'setup_wizard_logo': 'Would you like to upload your logo?',
      'upload': 'Upload',
      'installed_version': 'Installed Version',
      'notify_vendor_when_paid': 'Notify Vendor When Paid',
      'notify_vendor_when_paid_help':
          'Send an email to the vendor when the expense is marked as paid',
      'update_payment': 'Update Payment',
      'markup': 'Markup',
      'purchase_order_created': 'Purchase Order Created',
      'purchase_order_sent': 'Purchase Order Sent',
      'purchase_order_viewed': 'Purchase Order Viewed',
      'purchase_order_accepted': 'Purchase Order Accepted',
      'credit_payment_error':
          'The credit amount can not be greater than the payment amount',
      'klarna': 'Klarna',
      'convert_payment_currency_help':
          'Set an exchange rate when entering a manual payment',
      'convert_expense_currency_help':
          'Set an exchange rate when creating an expense',
      'matomo_url': 'Matomo URL',
      'matomo_id': 'Matomo Id',
      'action_add_to_invoice': 'Add To Invoice',
      'online_payment_email_help':
          'Send an email when an online payment is made',
      'manual_payment_email_help':
          'Send an email when manually entering a payment',
      'mark_paid_payment_email_help':
          'Send an email when marking an invoice as paid',
      'delete_project': 'Delete Project',
      'linked_transaction': 'Successfully linked transaction',
      'link_payment': 'Link Payment',
      'link_expense': 'Link Expense',
      'lock_invoiced_tasks': 'Lock Invoiced Tasks',
      'lock_invoiced_tasks_help':
          'Prevent tasks from being edited once invoiced',
      'registration_required': 'Registration Required',
      'registration_required_help': 'Require clients to register',
      'use_inventory_management': 'Use Inventory Management',
      'use_inventory_management_help': 'Require products to be in stock',
      'optional_products': 'Optional Products',
      'optional_recurring_products': 'Optional Recurring Products',
      'convert_matched': 'Convert',
      'auto_billed_invoice': 'Successfully queued invoice to be auto-billed',
      'auto_billed_invoices': 'Successfully queued invoices to be auto-billed',
      'operator': 'Operator',
      'value': 'Value',
      'is': 'Is',
      'contains': 'Contains',
      'starts_with': 'Starts with',
      'is_empty': 'Is empty',
      'add_rule': 'Add Rule',
      'match_all_rules': 'Match All Rules',
      'match_all_rules_help':
          'All criteria needs to match for the rule to be applied',
      'auto_convert_help':
          'Automatically convert matched transactions to expenses',
      'rules': 'Rules',
      'transaction_rule': 'Transaction Rule',
      'transaction_rules': 'Transaction Rules',
      'new_transaction_rule': 'New Transaction Rule',
      'edit_transaction_rule': 'Edit Transaction Rule',
      'created_transaction_rule': 'Successfully created rule',
      'updated_transaction_rule': 'Successfully updated transaction rule',
      'archived_transaction_rule': 'Successfully archived transaction rule',
      'deleted_transaction_rule': 'Successfully deleted transaction rule',
      'removed_transaction_rule': 'Successfully removed transaction rule',
      'restored_transaction_rule': 'Successfully restored transaction rule',
      'search_transaction_rule': 'Search Transaction Rule',
      'search_transaction_rules': 'Search Transaction Rules',
      'save_as_default_terms': 'Save as default terms',
      'save_as_default_footer': 'Save as default footer',
      'auto_sync': 'Auto Sync',
      'refresh_accounts': 'Refresh Accounts',
      'upgrade_to_connect_bank_account':
          'Upgrade to Enterprise to connect your bank account',
      'click_here_to_connect_bank_account':
          'Click here to connect your bank account',
      'disable_2fa': 'Disable 2FA',
      'change_number': 'Change Number',
      'resend_code': 'Resend Code',
      'base_type': 'Base Type',
      'category_type': 'Category Type',
      'bank_transaction': 'Transaction',
      'bulk_print': 'Print PDF',
      'vendor_postal_code': 'Vendor Postal Code',
      'preview_location': 'Preview Location',
      'bottom': 'Bottom',
      'side': 'Side',
      'pdf_preview': 'PDF Preview',
      'long_press_to_select': 'Long Press to Select',
      'purchase_order_number': 'Purchase Order Number',
      'purchase_order_item': 'Purchase Order Item',
      'would_you_rate_the_app': 'Would you like to rate the app?',
      'include_deleted': 'Include Deleted',
      'include_deleted_help': 'Include deleted records in reports',
      'due_on': 'Due On',
      'converted_transactions': 'Successfully converted transactions',
      'created_bank_account': 'Successfully created bank account',
      'updated_bank_account': 'Successfully updated bank account',
      'edit_bank_account': 'Edit Bank Account',
      'default_category': 'Default Category',
      'account_type': 'Account Type',
      'new_bank_account': 'New Bank Account',
      'connect_accounts': 'Connect Accounts',
      'manage_rules': 'Manage Rules',
      'search_category': 'Search 1 Category',
      'search_categories': 'Search :count Categories',
      'min_amount': 'Min Amount',
      'max_amount': 'Max Amount',
      'selected': 'Selected',
      'converted_transaction': 'Successfully converted transaction',
      'convert_to_payment': 'Convert to Payment',
      'deposit': 'Deposit',
      'withdrawal': 'Withdrawal',
      'deposits': 'Deposits',
      'withdrawals': 'Withdrawals',
      'matched': 'Matched',
      'unmatched': 'Unmatched',
      'create_credit': 'Create Credit',
      'update_credit': 'Update Credit',
      'delete_credit': 'Delete Credit',
      'transaction': 'Transaction',
      'transactions': 'Transactions',
      'new_transaction': 'New Transaction',
      'edit_transaction': 'Edit Transaction',
      'created_transaction': 'Successfully created transaction',
      'updated_transaction': 'Successfully updated transaction',
      'archived_transaction': 'Successfully archived transaction',
      'deleted_transaction': 'Successfully deleted transaction',
      'removed_transaction': 'Successfully removed transaction',
      'restored_transaction': 'Successfully restored transaction',
      'search_transaction': 'Search Transaction',
      'search_transactions': 'Search :count Transactions',
      'bank_account': 'Bank Account',
      'bank_accounts': 'Bank Accounts',
      'archived_bank_account': 'Successfully archived bank account',
      'deleted_bank_account': 'Successfully deleted bank account',
      'removed_bank_account': 'Successfully removed bank account',
      'restored_bank_account': 'Successfully restored bank account',
      'search_bank_account': 'Search Bank Account',
      'search_bank_accounts': 'Search :count Bank Accounts',
      'connect': 'Connect',
      'mark_paid_payment_email': 'Mark Paid Payment Email',
      'convert_to_project': 'Convert to Project',
      'client_email': 'Client Email',
      'invoice_task_project': 'Invoice Task Project',
      'invoice_task_project_help': 'Add the project to the invoice line items',
      'field': 'Field',
      'period': 'Period',
      'fields_per_row': 'Fields Per Row',
      'total_active_invoices': 'Active Invoices',
      'total_outstanding_invoices': 'Outstanding Invoices',
      'total_completed_payments': 'Completed Payments',
      'total_refunded_payments': 'Refunded Payments',
      'total_active_quotes': 'Active Quotes',
      'total_approved_quotes': 'Approved Quotes',
      'total_unapproved_quotes': 'Unapproved Quotes',
      'total_logged_tasks': 'Logged Tasks',
      'total_invoiced_tasks': 'Invoiced Tasks',
      'total_paid_tasks': 'Paid Tasks',
      'total_logged_expenses': 'Logged Expenses',
      'total_pending_expenses': 'Pending Expenses',
      'total_invoiced_expenses': 'Invoiced Expenses',
      'total_invoice_paid_expenses': 'Invoice Paid Expenses',
      'activity_130': ':user created purchase order :purchase_order',
      'activity_131': ':user updated purchase order :purchase_order',
      'activity_132': ':user archived purchase order :purchase_order',
      'activity_133': ':user deleted purchase order :purchase_order',
      'activity_134': ':user restored purchase order :purchase_order',
      'activity_135': ':user emailed purchase order :purchase_order',
      'activity_136': ':contact viewed purchase order :purchase_order',
      'activity_137': ':contact accepted purchase order :purchase_order',
      'vendor_portal': 'Vendor Portal',
      'send_code': 'Send Code',
      'save_to_upload_documents': 'Save the record to upload documents',
      'expense_tax_rates': 'Expense Tax Rates',
      'invoice_item_tax_rates': 'Invoice Item Tax Rates',
      'verified_phone_number': 'Successfully verified phone number',
      'code_was_sent': 'A code has been sent via SMS',
      'code_was_sent_to': 'A code has been sent via SMS to :number',
      'resend': 'Resend',
      'verify': 'Verify',
      'enter_phone_number': 'Please provide a phone number',
      'invalid_phone_number': 'Invalid phone number',
      'verify_phone_number': 'Verify Phone Number',
      'verify_phone_number_help':
          'Please verify your phone number to send emails',
      'verify_phone_number_2fa_help':
          'Please verify your phone number for 2FA backup',
      'merged_clients': 'Successfully merged clients',
      'merge_into': 'Merge Into',
      'merge': 'Merge',
      'price_change_accepted': 'Price change accepted',
      'price_change_failed': 'Price change failed with code',
      'restore_purchases': 'Restore Purchases',
      'activate': 'Activate',
      'connect_apple': 'Connect Apple',
      'disconnect_apple': 'Disconnect Apple',
      'disconnected_apple': 'Successfully disconnected Apple',
      'send_now': 'Send Now',
      'received': 'Received',
      'purchase_order_date': 'Purchase Order Date',
      'converted_to_expense': 'Successfully converted to expense',
      'converted_to_expenses': 'Successfully converted to expenses',
      'convert_to_expense': 'Convert to Expense',
      'add_to_inventory': 'Add to Inventory',
      'added_purchase_order_to_inventory':
          'Successfully added purchase order to inventory',
      'added_purchase_orders_to_inventory':
          'Successfully added purchase orders to inventory',
      'client_document_upload': 'Client Document Upload',
      'vendor_document_upload': 'Vendor Document Upload',
      'vendor_document_upload_help': 'Enable vendors to upload documents',
      'are_you_enjoying_the_app': 'Are you enjoying the app?',
      'yes_its_great': 'Yes, it\'s great!',
      'not_so_much': 'Not so much',
      'would_you_rate_it': 'Great to hear! Would you like to rate it?',
      'would_you_tell_us_more':
          'Sorry to hear it! Would you like to tell us more?',
      'sure_happy_to': 'Sure, happy to',
      'no_not_now': 'No, not now',
      'add': 'Add',
      'last_sent_template': 'Last Sent Template',
      'enable_flexible_search': 'Enable Flexible Search',
      'enable_flexible_search_help':
          'Match non-contiguous characters, ie. \'ct\' matches \'cat\'',
      'vendor_details': 'Vendor Details',
      'purchase_order_details': 'Purchase Order Details',
      'qr_iban': 'QR IBAN',
      'besr_id': 'BESR ID',
      'accept': 'Accept',
      'clone_to_purchase_order': 'Clone to PO',
      'vendor_email_not_set': 'Vendor does not have an email address set',
      'bulk_send_email': 'Send Email',
      'marked_purchase_order_as_sent':
          'Successfully marked purchase order as sent',
      'marked_purchase_orders_as_sent':
          'Successfully marked purchase orders as sent',
      'accepted_purchase_order': 'Successfully accepted purchase order',
      'accepted_purchase_orders': 'Successfully accepted purchase orders',
      'cancelled_purchase_order': 'Successfully cancelled purchase order',
      'cancelled_purchase_orders': 'Successfully cancelled purchase orders',
      'accepted': 'Accepted',
      'please_select_a_vendor': 'Please select a vendor',
      'purchase_order_total': 'Purchase Order Total',
      'email_purchase_order': 'Email Purchase Order',
      'bulk_email_purchase_orders': 'Email Purchase Orders',
      'disconnected_email': 'Successfully disconnected email',
      'connect_email': 'Connect Email',
      'disconnect_email': 'Disconnect Email',
      'use_web_app_to_connect_microsoft':
          'Please use the web app to connect to Microsoft',
      'email_provider': 'Email Provider',
      'connect_microsoft': 'Connect Microsoft',
      'disconnect_microsoft': 'Disconnect Microsoft',
      'connected_microsoft': 'Successfully connected Microsoft',
      'disconnected_microsoft': 'Successfully disconnected Microsoft',
      'microsoft_sign_in': 'Login with Microsoft',
      'microsoft_sign_up': 'Sign up with Microsoft',
      'emailed_purchase_order': 'Successfully queued purchase order to be sent',
      'emailed_purchase_orders':
          'Successfully queued purchase orders to be sent',
      'enable_react_app': 'Change to the React web app',
      'purchase_order_design': 'Purchase Order Design',
      'purchase_order_terms': 'Purchase Order Terms',
      'purchase_order_footer': 'Purchase Order Footer',
      'require_purchase_order_signature': 'Purchase Order Signature',
      'require_purchase_order_signature_help':
          'Require vendor to provide their signature.',
      'purchase_order': 'Purchase Order',
      'purchase_orders': 'Purchase Orders',
      'new_purchase_order': 'New Purchase Order',
      'edit_purchase_order': 'Edit Purchase Order',
      'created_purchase_order': 'Successfully created purchase order',
      'updated_purchase_order': 'Successfully updated purchase order',
      'archived_purchase_order': 'Successfully archived purchase order',
      'deleted_purchase_order': 'Successfully deleted purchase order',
      'removed_purchase_order': 'Successfully removed purchase order',
      'restored_purchase_order': 'Successfully restored purchase order',
      'search_purchase_order': 'Search Purchase Order',
      'search_purchase_orders': 'Search Purchase Orders',
      'login_url': 'Login URL',
      'payment_settings': 'Payment Settings',
      'default': 'Default',
      'stock_quantity': 'Stock Quantity',
      'notification_threshold': 'Notification Threshold',
      'track_inventory': 'Track Inventory',
      'track_inventory_help':
          'Display a product stock field and update when invoices are sent',
      'stock_notifications': 'Stock Notifications',
      'stock_notifications_help':
          'Send an email when the stock reaches the threshold',
      'vat': 'VAT',
      'standing': 'Standing',
      'view_map': 'View Map',
      'set_default_design': 'Set Default Design',
      'add_gateway': 'Add Gateway',
      'add_gateway_help_message':
          'Add a payment gateway (ie. Stripe, WePay or PayPal) to accept online payments',
      'left': 'Left',
      'right': 'Right',
      'center': 'Center',
      'page_numbering': 'Page Numbering',
      'page_numbering_alignment': 'Page Numbering Alignment',
      'invoice_sent_notification_label': 'Invoice Sent',
      'show_product_description': 'Show Product Description',
      'show_product_description_help':
          'Include the description in the product dropdown',
      'invoice_items': 'Invoice Items',
      'quote_items': 'Quote Items',
      'profitloss': 'Profit and Loss',
      'import_format': 'Import Format',
      'export_format': 'Export Format',
      'export_type': 'Export Type',
      'stop_on_unpaid': 'Stop On Unpaid',
      'stop_on_unpaid_help':
          'Stop creating recurring invoices if the last invoice is unpaid.',
      'use_quote_terms': 'Use Quote Terms',
      'use_quote_terms_help': 'When converting a quote to an invoice',
      'add_country': 'Add Country',
      'enable_tooltips': 'Enable Tooltips',
      'enable_tooltips_help': 'Show tooltips when hovering the mouse',
      'multiple_client_error': 'Error: records belong to more than one client',
      'register_label': 'Create your account in seconds',
      'login_label': 'Login to an existing account',
      'add_to_invoice': 'Add To Invoice',
      'no_invoices_found': 'No invoices found',
      'week': 'Week',
      'created_record': 'Successfully created record',
      'auto_archive_paid_invoices': 'Auto Archive Paid',
      'auto_archive_paid_invoices_help':
          'Automatically archive invoices when they are paid.',
      'auto_archive_cancelled_invoices': 'Auto Archive Cancelled',
      'auto_archive_cancelled_invoices_help':
          'Automatically archive invoices when they are cancelled.',
      'alternate_pdf_viewer': 'Alternate PDF Viewer',
      'alternate_pdf_viewer_help': 'Improve scrolling over the PDF preview',
      'invoice_currency': 'Invoice Currency',
      'range': 'Range',
      'tax_amount1': 'Tax Amount 1',
      'tax_amount2': 'Tax Amount 2',
      'tax_amount3': 'Tax Amount 3',
      'create_project': 'Create Project',
      'update_project': 'Update Project',
      'view_task': 'View Task',
      'cancel_invoice': 'Cancel Invoice',
      'changed_status': 'Successfully changed task status',
      'change_status': 'Change Status',
      'fees_sample': 'The fee for a :amount invoice would be :total.',
      'enable_touch_events': 'Enable Touch Events',
      'enable_touch_events_help': 'Support drag events to scroll',
      'after_saving': 'After Saving',
      'view_record': 'View Record',
      'enable_email_markdown': 'Enable Email Markdown',
      'enable_email_markdown_help':
          'Use visual WYSIWYG markdown editor for emails',
      'enable_pdf_markdown': 'Enable PDF Markdown',
      'json_help': 'Note: JSON files generated by the v4 app are not supported',
      'release_notes': 'Release Notes',
      'upgrade_to_view_reports': 'Upgrade your plan to view reports',
      'started_tasks': 'Successfully started :value tasks',
      'stopped_tasks': 'Successfully stopped :value tasks',
      'approved_quote': 'Successfully approved quote',
      'approved_quotes': 'Successfully :value approved quotes',
      'approve': 'Approve',
      'client_website': 'Client Website',
      'invalid_time': 'Invalid Time',
      'client_shipping_state': 'Client Shipping State',
      'client_shipping_city': 'Client Shipping City',
      'client_shipping_postal_code': 'Client Shipping Postal Code',
      'client_shipping_country': 'Client Shipping Country',
      'load_pdf': 'Load PDF',
      'start_free_trial': 'Pro Plan Trial / Account Upgrade',
      'start_free_trial_message': 'Start your FREE 14 day Pro Plan trial',
      'due_on_receipt': 'Due on Receipt',
      'is_paid': 'Is Paid',
      'age_group_paid': 'Paid',
      'id': 'Id',
      'convert_to': 'Convert To',
      'client_currency': 'Client Currency',
      'company_currency': 'Company Currency',
      'purged_client': 'Successfully purged client',
      'custom_emails_disabled_help':
          'To prevent spam we require upgrading to a paid account to customize the email',
      'upgrade_to_add_company': 'Upgrade your plan to add companies',
      'small': 'Small',
      'marked_credit_as_paid': 'Successfully marked credit as paid',
      'marked_credits_as_paid': 'Successfully marked credits as paid',
      'wait_for_loading': 'Data loading - please wait for it to complete',
      'wait_for_saving': 'Data saving - please wait for it to complete',
      'html_preview_warning':
          'Note: changes made here are only previewed, they must be applied in the tabs above to be saved',
      'remaining': 'Remaining',
      'invoice_paid': 'Invoice Paid',
      'activity_120': ':user created recurring expense :recurring_expense',
      'activity_121': ':user updated recurring expense :recurring_expense',
      'activity_122': ':user archived recurring expense :recurring_expense',
      'activity_123': ':user deleted recurring expense :recurring_expense',
      'activity_124': ':user restored recurring expense :recurring_expense',
      'normal': 'Normal',
      'large': 'Large',
      'extra_large': 'Extra Large',
      'show_pdf_preview': 'Show PDF Preview',
      'show_pdf_preview_help': 'Display PDF preview while editing invoices',
      'print_pdf': 'Print PDF',
      'remind_me': 'Remind Me',
      'instant_bank_pay': 'Instant Bank Pay',
      'click_selected': 'Click Selected',
      'hide_preview': 'Hide Preview',
      'edit_record': 'Edit Record',
      'credit_is_more_than_invoice':
          'The credit amount can not be more than the invoice amount',
      'giropay': 'Giropay',
      'direct_debit': 'Direct Debit',
      'please_set_a_password': 'Please set an account password',
      'set_password': 'Set Password',
      'disconnected_gateway': 'Successfully disconnected gateway',
      'disconnect': 'Disconnect',
      'add_to_invoices': 'Add to Invoices',
      'acss': 'ACSS',
      'becs': 'BECS',
      'bulk_download': 'Download',
      'persist_data_help':
          'Save data locally to enable the app to start faster, disabling may improve performance in large accounts',
      'persist_ui': 'Persist UI',
      'persist_ui_help':
          'Save UI state locally to enable the app to start at the last location, disabling may improve performance',
      'client_postal_code': 'Client Postal Code',
      'client_vat_number': 'Client VAT Number',
      'has_tasks': 'Has Tasks',
      'registration': 'Registration',
      'unauthorized_stripe_warning':
          'Please authorize Stripe to accept online payments.',
      'view_expense': 'View Expense',
      'view_statement': 'View Statement',
      'sepa': 'SEPA',
      'ideal': 'iDEAL',
      'przelewy24': 'Przelewy24',
      'eps': 'EPS',
      'fpx': 'FPX',
      'update_all_records': 'Update all records',
      'system': 'System',
      'set_default_company': 'Set Default Company',
      'updated_company': 'Successfully updated company',
      'kbc': 'KBC',
      'bancontact': 'Bancontact',
      'why_are_you_leaving': 'Help us improve by telling us why (optional)',
      'webhook_success': 'Webhook Success',
      'error_cross_client_tasks': 'Tasks must all belong to the same client',
      'error_cross_client_expenses':
          'Expenses must all belong to the same client',
      'app': 'App',
      'for_best_performance': 'For the best performance download the :app app',
      'gross_line_total': 'Gross Line Total',
      'bulk_email_invoices': 'Email Invoices',
      'bulk_email_quotes': 'Email Quotes',
      'bulk_email_credits': 'Email Credits',
      'from_name': 'From Name',
      'clone_to_expense': 'Clone to Expense',
      'recurring_expense': 'Recurring Expense',
      'recurring_expenses': 'Recurring Expenses',
      'new_recurring_expense': 'New Recurring Expense',
      'edit_recurring_expense': 'Edit Recurring Expense',
      'created_recurring_expense': 'Successfully created recurring expense',
      'updated_recurring_expense': 'Successfully updated recurring expense',
      'archived_recurring_expense': 'Successfully archived recurring expense',
      'deleted_recurring_expense': 'Successfully deleted recurring expense',
      'removed_recurring_expense': 'Successfully removed recurring expense',
      'restored_recurring_expense': 'Successfully restored recurring expense',
      'search_recurring_expense': 'Search Recurring Expense',
      'search_recurring_expenses': 'Search Recurring Expenses',
      'last_sent_date': 'Last Sent Date',
      'include_drafts': 'Include Drafts',
      'include_drafts_help': 'Include draft records in reports',
      'is_invoiced': 'Is Invoiced',
      'change_plan': 'Change Plan',
      'persist_data': 'Persist Data',
      'customer_count': 'Customer Count',
      'verify_customers': 'Verify Customers',
      'google_analytics': 'Google Analytics',
      'google_analytics_tracking_id': 'Google Analytics Tracking ID',
      'decimal_comma': 'Decimal Comma',
      'use_comma_as_decimal_place': 'Use comma as decimal place in forms',
      'select_method': 'Select Method',
      'select_platform': 'Select Platform',
      'use_web_app_to_connect_gmail':
          'Please use the web app to connect to Gmail',
      'expense_tax_help': 'Expense tax rates are disabled',
      'enable_markdown': 'Enable Markdown',
      'enable_markdown_help': 'Convert markdown to HTML on the PDF',
      'user_guide': 'User Guide',
      'add_second_contact': 'Add Second Contact',
      'previous_page': 'Previous Page',
      'next_page': 'Next Page',
      'export_colors': 'Export Colors',
      'import_colors': 'Import Colors',
      'clear_all': 'Clear All',
      'contrast': 'Contrast',
      'custom_colors': 'Custom Colors',
      'colors': 'Colors',
      'sidebar_active_background_color': 'Sidebar Active Background Color',
      'sidebar_active_font_color': 'Sidebar Active Font Color',
      'sidebar_inactive_background_color': 'Sidebar Inactive Background Color',
      'sidebar_inactive_font_color': 'Sidebar Inactive Font Color',
      'table_alternate_row_background_color':
          'Table Alternate Row Background Color',
      'invoice_header_background_color': 'Invoice Header Background Color',
      'invoice_header_font_color': 'Invoice Header Font Color',
      'net_subtotal': 'Net Subtotal',
      'review_app': 'Review App',
      'check_status': 'Check Status',
      'free_trial': 'Free Trial',
      'free_trial_ends_in_days': 'The Pro plan trial ends in :count days',
      'free_trial_ends_today': 'Today is the last day of the Pro plan trial',
      'change_email': 'Change Email',
      'client_portal_domain_hint':
          'Optionally configure a separate client portal domain',
      'tasks_shown_in_portal': 'Tasks Shown in Portal',
      'uninvoiced': 'Uninvoiced',
      'subdomain_guide':
          'The subdomain is used in the client portal to personalize links to match your brand. ie, https://your-brand.invoicing.co',
      'send_time': 'Send Time',
      'import_data': 'Import Data',
      'import_settings': 'Import Settings',
      'json_file_missing': 'Please provide the JSON file',
      'json_option_missing': 'Please select to import the settings and/or data',
      'json': 'JSON',
      'no_payment_types_enabled': 'No payment types enabled',
      'wait_for_data': 'Please wait for the data to finish loading',
      'net_total': 'Net Total',
      'has_taxes': 'Has Taxes',
      'import_customers': 'Import Customers',
      'imported_customers': 'Successfully started importing customers',
      'login_success': 'Successful Login',
      'login_failure': 'Failed Login',
      'exported_data':
          'Once the file is ready you\'ll receive an email with a download link',
      'include_deleted_clients': 'Include Deleted Clients',
      'include_deleted_clients_help':
          'Load records belonging to deleted clients',
      'step_1_sign_in': 'Step 1: Sign In',
      'step_2_authorize': 'Step 2: Authorize',
      'account_id': 'Account ID',
      'migration_not_yet_completed': 'The migration has not yet completed',
      'activity_100': ':user created recurring invoice :recurring_invoice',
      'activity_101': ':user updated recurring invoice :recurring_invoice',
      'activity_102': ':user archived recurring invoice :recurring_invoice',
      'activity_103': ':user deleted recurring invoice :recurring_invoice',
      'activity_104': ':user restored recurring invoice :recurring_invoice',
      'show_task_end_date': 'Show Task End Date',
      'show_task_end_date_help': 'Enable specifying the task end date',
      'gateway_setup': 'Gateway Setup',
      'preview_sidebar': 'Preview Sidebar',
      'years_data_shown': 'Years Data Shown',
      'ended_all_sessions': 'Successfully ended all sessions',
      'end_all_sessions': 'End All Sessions',
      'count_session': '1 Session',
      'count_sessions': ':count Sessions',
      'invoice_created': 'Invoice Created',
      'quote_created': 'Quote Created',
      'credit_created': 'Credit Created',
      'pro': 'Pro',
      'enterprise': 'Enterprise',
      'last_updated': 'Last Updated',
      'invoice_item': 'Invoice Item',
      'quote_item': 'Quote Item',
      'contact_first_name': 'Contact First Name',
      'contact_last_name': 'Contact Last Name',
      'order': 'Order',
      'unassigned': 'Unassigned',
      'partial_value': 'Must be greater than zero and less than the total',
      'search_kanban': 'Search Kanban',
      'search_kanbans': 'Search Kanban',
      'kanban': 'Kanban',
      'enable': 'Enable',
      'move_top': 'Move Top',
      'move_up': 'Move Up',
      'move_down': 'Move Down',
      'move_bottom': 'Move Bottom',
      'subdomain_help': 'Lowercase letters, numbers and hyphens are supported',
      'body_variable_missing':
          'Error: the custom email must include a :body variable',
      'add_body_variable_message': 'Make sure to include a :body variable',
      'view_date_formats': 'View Date Formats',
      'is_viewed': 'Is Viewed',
      'letter': 'Letter',
      'legal': 'Legal',
      'page_layout': 'Page Layout',
      'portrait': 'Portrait',
      'landscape': 'Landscape',
      'owner_upgrade_to_paid_plan':
          'The account owner can upgrade to a paid plan to enable the advanced advanced settings',
      'upgrade_to_paid_plan':
          'Upgrade to a paid plan to enable the advanced settings',
      'invoice_payment_terms': 'Invoice Payment Terms',
      'quote_valid_until': 'Quote Valid Until',
      'no_headers': 'No Headers',
      'add_header': 'Add Header',
      'remove_header': 'Remove Header',
      'return_url': 'Return URL',
      'rest_method': 'REST Method',
      'header_key': 'Header Key',
      'header_value': 'Header Value',
      'recurring_products': 'Recurring Products',
      'promo_code': 'Promo Code',
      'promo_discount': 'Promo Discount',
      'allow_cancellation': 'Allow Cancellation',
      'per_seat_enabled': 'Per Seat Enabled',
      'max_seats_limit': 'Max Seats Limit',
      'trial_enabled': 'Trial Enabled',
      'trial_duration': 'Trial Duration',
      'allow_query_overrides': 'Allow Query Overrides',
      'allow_plan_changes': 'Allow Plan Changes',
      'plan_map': 'Plan Map',
      'refund_period': 'Refund Period',
      'webhook_configuration': 'Webhook Configuration',
      'purchase_page': 'Purchase Page',
      'security': 'Security',
      'email_bounced': 'Email Bounced',
      'email_spam_complaint': 'Spam Complaint',
      'email_delivery': 'Email Delivery',
      'webhook_response': 'Webhook Response',
      'pdf_response': 'PDF Response',
      'authentication_failure': 'Authentication Failure',
      'pdf_failed': 'PDF Failed',
      'pdf_success': 'PDF Success',
      'modified': 'Modified',
      'payment_link': 'Payment Link',
      'new_payment_link': 'New Payment Link',
      'edit_payment_link': 'Edit Payment Link',
      'created_payment_link': 'Successfully created payment link',
      'updated_payment_link': 'Successfully updated payment link',
      'archived_payment_link': 'Successfully archived payment link',
      'deleted_payment_link': 'Successfully deleted payment link',
      'removed_payment_link': 'Successfully removed payment link',
      'restored_payment_link': 'Successfully restored payment link',
      'search_payment_link': 'Search 1 Payment Link',
      'search_payment_links': 'Search :count Payment Links',
      'subdomain_is_not_available': 'Subdomain is not available',
      'connect_gmail': 'Connect Gmail',
      'disconnect_gmail': 'Disconnect Gmail',
      'connected_gmail': 'Successfully connected Gmail',
      'disconnected_gmail': 'Successfully disconnected Gmail',
      'update_fail_help':
          'Changes to the codebase may be blocking the update, you can run this command to discard the changes:',
      'client_id_number': 'Client ID Number',
      'count_minutes': ':count Minutes',
      'password_timeout': 'Password Timeout',
      'shared_invoice_credit_counter': 'Shared Invoice/Credit Counter',
      'use_last_email': 'Use last email',
      'activate_company': 'Activate Company',
      'activate_company_help':
          'Enable emails, recurring invoices, webhooks and notifications',
      'an_error_occurred_try_again': 'An error occurred, please try again',
      'please_first_set_a_password': 'Please first set a password',
      'changing_phone_disables_two_factor':
          'Warning: Changing your phone number will disable 2FA',
      'help_translate': 'Help Translate',
      'please_select_a_country': 'Please select a country',
      'resend_invite': 'Resend Invite',
      'disabled_two_factor': 'Successfully disabled 2FA',
      'connected_google': 'Successfully connected account',
      'disconnected_google': 'Successfully disconnected account',
      'delivered': 'Delivered',
      'bounced': 'Bounced',
      'spam': 'Spam',
      'view_docs': 'View Docs',
      'enter_phone_to_enable_two_factor':
          'Please provide a mobile phone number to enable two factor authentication',
      'send_sms': 'Send SMS',
      'sms_code': 'SMS Code',
      'two_factor_setup_help': 'Scan the bar code with a :link compatible app.',
      'enabled_two_factor': 'Successfully enabled Two-Factor Authentication',
      'connect_google': 'Connect Google',
      'disconnect_google': 'Disconnect Google',
      'enable_two_factor': 'Enable Two Factor',
      'disable_two_factor': 'Disable Two Factor',
      'require_password_with_social_login':
          'Require Password with Social Login',
      'stay_logged_in': 'Stay Logged In',
      'session_about_to_expire': 'Warning: Your session is about to expire',
      'count_hours': ':count Hours',
      'count_day': '1 Day',
      'count_days': ':count Days',
      'web_session_timeout': 'Web Session Timeout',
      'security_settings': 'Security Settings',
      'resend_email': 'Resend Email',
      'confirm_your_email_address': 'Please confirm your email address',
      'refunded_payment': 'Successfully refunded payment',
      'partially_unapplied': 'Partially Unapplied',
      'select_a_gmail_user': 'Please select a user authenticated with Gmail',
      'list_long_press': 'List Long Press',
      'show_actions': 'Show Actions',
      'start_multiselect': 'Start Multiselect',
      'email_sent_to_confirm_email':
          'An email has been sent to confirm the email address',
      'counter_pattern_error':
          'To use :client_counter please add either :client_number or :client_id_number to prevent conflicts',
      'this_quarter': 'This Quarter',
      'last_quarter': 'Last Quarter',
      'to_update_run': 'To update run',
      'convert_to_invoice': 'Convert to Invoice',
      'registration_url': 'Registration URL',
      'invoice_project': 'Invoice Project',
      'invoice_task': 'Invoice Task',
      'invoice_expense': 'Invoice Expense',
      'search_payment_term': 'Search 1 Payment Term',
      'search_payment_terms': 'Search :count Payment Terms',
      'save_and_preview': 'Save and Preview',
      'save_and_email': 'Save and Email',
      'supported_events': 'Supported Events',
      'converted_amount': 'Converted Amount',
      'converted_balance': 'Converted Balance',
      'converted_paid_to_date': 'Converted Paid to Date',
      'converted_credit_balance': 'Converted Credit Balance',
      'converted_total': 'Converted Total',
      'is_sent': 'Is Sent',
      'default_documents': 'Default Documents',
      'document_upload': 'Document Upload',
      'document_upload_help': 'Enable clients to upload documents',
      'expense_total': 'Expense Total',
      'enter_taxes': 'Enter Taxes',
      'by_rate': 'By Rate',
      'by_amount': 'By Amount',
      'enter_amount': 'Enter Amount',
      'before_taxes': 'Before Taxes',
      'after_taxes': 'After Taxes',
      'color': 'Color',
      'show': 'Show',
      'hide': 'Hide',
      'empty_columns': 'Empty Columns',
      'debug_mode_is_enabled': 'Debug mode is enabled',
      'debug_mode_is_enabled_help':
          'Warning: it is intended for use on local machines, it can leak credentials. Click to learn more.',
      'running_tasks': 'Running Tasks',
      'recent_tasks': 'Recent Tasks',
      'recent_expenses': 'Recent Expenses',
      'upcoming_expenses': 'Upcoming Expenses',
      'update_app': 'Update App',
      'started_import': 'Successfully started import',
      'duplicate_column_mapping': 'Duplicate column mapping',
      'uses_inclusive_taxes': 'Uses Inclusive Taxes',
      'is_amount_discount': 'Is Amount Discount',
      'column': 'Column',
      'sample': 'Sample',
      'map_to': 'Map To',
      'import': 'Import',
      'first_row_as_column_names': 'Use first row as column names',
      'select_file': 'Select File',
      'no_file_selected': 'No File Selected',
      'csv_file': 'CSV File',
      'csv': 'CSV',
      'freshbooks': 'FreshBooks',
      'invoice2go': 'Invoice2go',
      'invoicely': 'Invoicely',
      'waveaccounting': 'Wave Accounting',
      'zoho': 'Zoho',
      'accounting': 'Accounting',
      'required_files_missing': 'Please provide all CSVs.',
      'import_type': 'Import Type',
      'html_mode': 'HTML Mode',
      'html_mode_help': 'Preview updates faster but is less accurate',
      'view_licenses': 'View Licenses',
      'webhook_url': 'Webhook URL',
      'fullscreen_editor': 'Fullscreen Editor',
      'sidebar_editor': 'Sidebar Editor',
      'please_type_to_confirm': 'Please type \':value\' to confirm',
      'purge': 'Purge',
      'service': 'Service',
      'clone_to': 'Clone To',
      'clone_to_other': 'Clone to Other',
      'labels': 'Labels',
      'add_custom': 'Add Custom',
      'payment_tax': 'Payment Tax',
      'expense_tax': 'Expense Tax',
      'unpaid': 'Unpaid',
      'white_label': 'White Label',
      'delivery_note': 'Delivery Note',
      'sent_invoices_are_locked': 'Sent invoices are locked',
      'paid_invoices_are_locked': 'Paid invoices are locked',
      'source_code': 'Source Code',
      'app_platforms': 'App Platforms',
      'invoice_late': 'Invoice Late',
      'quote_expired': 'Quote Expired',
      'partial_due': 'Partial Due',
      'invoice_total': 'Invoice Total',
      'quote_total': 'Quote Total',
      'credit_total': 'Credit Total',
      'recurring_invoice_total': 'Invoice Total',
      'actions': 'Actions',
      'expense_number': 'Expense Number',
      'task_number': 'Task Number',
      'project_number': 'Project Number',
      'project_name': 'Project Name',
      'warning': 'Warning',
      'view_settings': 'View Settings',
      'company_disabled_warning': 'Company is not activated',
      'late_invoice': 'Late Invoice',
      'expired_quote': 'Expired Quote',
      'remind_invoice': 'Remind Invoice',
      'cvv': 'CVV',
      'client_name': 'Client Name',
      'client_phone': 'Client Phone',
      'required_fields': 'Required Fields',
      'calculated_rate': 'Calculated Rate',
      'default_task_rate': 'Default Task Rate',
      'clear_cache': 'Clear Cache',
      'sort_order': 'Sort Order',
      'task_status': 'Status',
      'task_statuses': 'Task Statuses',
      'new_task_status': 'New Task Status',
      'edit_task_status': 'Edit Task Status',
      'created_task_status': 'Successfully created task status',
      'updated_task_status': 'Successfully updated task status',
      'archived_task_status': 'Successfully archived task status',
      'deleted_task_status': 'Successfully deleted task status',
      'removed_task_status': 'Successfully removed task status',
      'restored_task_status': 'Successfully restored task status',
      'archived_task_statuses': 'Successfully archived :value task statuses',
      'deleted_task_statuses': 'Successfully deleted :value task statuses',
      'restored_task_statuses': 'Successfully restored :value task statuses',
      'search_task_status': 'Search 1 Task Status',
      'search_task_statuses': 'Search :count Task Statuses',
      'show_tasks_table': 'Show Tasks Table',
      'show_tasks_table_help':
          'Always show the tasks section when creating invoices',
      'invoice_task_timelog': 'Invoice Task Timelog',
      'invoice_task_timelog_help': 'Add time details to the invoice line items',
      'invoice_task_datelog': 'Invoice Task Datelog',
      'invoice_task_datelog_help': 'Add date details to the invoice line items',
      'auto_start_tasks_help': 'Start tasks before saving',
      'configure_statuses': 'Configure Statuses',
      'task_settings': 'Task Settings',
      'configure_categories': 'Configure Categories',
      'expense_categories': 'Expense Categories',
      'new_expense_category': 'New Expense Category',
      'edit_expense_category': 'Edit Expense Category',
      'created_expense_category': 'Successfully created expense category',
      'updated_expense_category': 'Successfully updated expense category',
      'archived_expense_category': 'Successfully archived expense category',
      'deleted_expense_category': 'Successfully deleted expense category',
      'removed_expense_category': 'Successfully removed expense category',
      'restored_expense_category': 'Successfully restored expense category',
      'archived_expense_categories':
          'Successfully archived expense :value categories',
      'deleted_expense_categories':
          'Successfully deleted expense :value categories',
      'restored_expense_categories':
          'Successfully restored expense :value categories',
      'search_expense_category': 'Search 1 Expense Category',
      'search_expense_categories': 'Search :count Expense Categories',
      'use_available_credits': 'Use Available Credits',
      'show_option': 'Show Option',
      'negative_payment_error': 'The payment amount can not be negative',
      'view_changes': 'View Changes',
      'force_update': 'Force Update',
      'force_update_help':
          'You are running the latest version but there may be pending fixes available.',
      'mark_paid_help': 'Track the expense has been paid to the vendor',
      'should_be_invoiced': 'Should be Invoiced',
      'should_be_invoiced_help':
          'Enable the expense to be invoiced to your client',
      'add_documents_to_invoice_help': 'Make the documents visible to clients',
      'convert_currency_help': 'Set an exchange rate',
      'expense_settings': 'Expense Settings',
      'clone_to_recurring': 'Clone to Recurring',
      'crypto': 'Crypto',
      'paypal': 'PayPal',
      'alipay': 'Alipay',
      'sofort': 'Sofort',
      'apple_pay': 'Apple Pay',
      'user_field': 'User Field',
      'variables': 'Variables',
      'show_password': 'Show Password',
      'hide_password': 'Hide Password',
      'copy_error': 'Copy Error',
      'capture_card': 'Capture Card',
      'auto_bill_enabled': 'Auto Bill Enabled',
      'total_taxes': 'Total Taxes',
      'line_taxes': 'Line Taxes', 'total_fields': 'Total Fields',
      'stopped_recurring_invoice': 'Successfully stopped recurring invoice',
      'started_recurring_invoice': 'Successfully started recurring invoice',
      'resumed_recurring_invoice': 'Successfully resumed recurring invoice',
      'gateway_refund': 'Gateway Refund',
      'gateway_refund_help': 'Process the refund with the payment gateway',
      'due_date_days': 'Due Date',
      'paused': 'Paused',
      'mark_active': 'Mark Active',
      'day_count': 'Day :count',
      'first_day_of_the_month': 'First Day of the Month',
      'last_day_of_the_month': 'Last Day of the Month',
      'use_payment_terms': 'Use Payment Terms',
      'endless': 'Endless',
      'next_send_date': 'Next Send Date',
      'remaining_cycles': 'Remaining Cycles',
      'recurring_invoice': 'Recurring Invoice',
      'recurring_invoices': 'Recurring Invoices',
      'new_recurring_invoice': 'New Recurring Invoice',
      'edit_recurring_invoice': 'Edit Recurring Invoice',
      'created_recurring_invoice': 'Successfully created recurring invoice',
      'updated_recurring_invoice': 'Successfully updated recurring invoice',
      'archived_recurring_invoice': 'Successfully archived recurring invoice',
      'deleted_recurring_invoice': 'Successfully deleted recurring invoice',
      'removed_recurring_invoice': 'Successfully removed recurring invoice',
      'restored_recurring_invoice': 'Successfully restored recurring invoice',
      'archived_recurring_invoices':
          'Successfully archived recurring :value invoices',
      'deleted_recurring_invoices':
          'Successfully deleted recurring :value invoices',
      'restored_recurring_invoices':
          'Successfully restored recurring :value invoices',
      'search_recurring_invoice': 'Search 1 Recurring Invoice',
      'search_recurring_invoices': 'Search :count Recurring Invoices',
      'send_date': 'Send Date',
      'auto_bill_on': 'Auto Bill On',
      'minimum_under_payment_amount': 'Minimum Under Payment Amount',
      'profit': 'Profit',
      'line_item': 'Line Item',
      'allow_over_payment': 'Allow Over Payment',
      'allow_over_payment_help':
          'Support paying extra to accept tips in the client portal',
      'allow_under_payment': 'Allow Under Payment',
      'allow_under_payment_help':
          'Support paying a minimum amount in the client portal',
      'test_mode': 'Test Mode',
      'opened': 'Opened',
      'payment_reconciliation_failure': 'Reconciliation Failure',
      'payment_reconciliation_success': 'Reconciliation Success',
      'gateway_success': 'Gateway Success',
      'gateway_failure': 'Gateway Failure',
      'gateway_error': 'Gateway Error',
      'email_send': 'Email Send',
      'email_retry_queue': 'Email Retry Queue',
      'failure': 'Failure',
      'quota_exceeded': 'Quota Exceeded',
      'upstream_failure': 'Upstream Failure',
      'system_logs': 'System Logs',
      'view_portal': 'View Portal',
      'copy_link': 'Copy Link',
      'token_billing': 'Token Billing',
      'welcome_to_invoice_ninja': 'Welcome to Invoice Ninja',
      'always': 'Enabled',
      'optin': 'Disabled by default',
      'optout': 'Enabled by default',
      'label': 'Label',
      'client_number': 'Client Number',
      'auto_convert': 'Auto Convert',
      'company_name': 'Company Name',
      'reminder1_sent': 'Reminder 1 Sent',
      'reminder2_sent': 'Reminder 2 Sent',
      'reminder3_sent': 'Reminder 3 Sent',
      'reminder_last_sent': 'Reminder Last Sent',
      'pdf_page_info': 'Page :current of :total',
      'emailed_invoices': 'Successfully queued invoices to be sent',
      'emailed_quotes': 'Successfully queued quotes to be sent',
      'emailed_credits': 'Successfully queued credits to be sent',
      'gateway': 'Gateway',
      'view_in_stripe': 'View in Stripe',
      'rows_per_page': 'Rows Per Page',
      'hours': 'Hours',
      'statement': 'Statement',
      'taxes': 'Taxes',
      'surcharge': 'Surcharge',
      'apply_payment': 'Apply Payment',
      'apply_credit': 'Apply Credit',
      'apply': 'Apply',
      'unapplied': 'Unapplied',
      'select_label': 'Select Label',
      'custom_labels': 'Custom Labels',
      'record_type': 'Record Type',
      'record_name': 'Record Name',
      'file_type': 'File Type',
      'height': 'Height',
      'width': 'Width',
      'to': 'To',
      'health_check': 'Health Check',
      'payment_type_id': 'Payment Type',
      'last_login_at': 'Last Login At',
      'company_key': 'Company Key',
      'storefront': 'Storefront',
      'storefront_help': 'Enable third-party apps to create invoices',
      'client_created': 'Client Created',
      'online_payment_email': 'Online Payment Email',
      'manual_payment_email': 'Manual Payment Email',
      'completed': 'Completed',
      'gross': 'Gross',
      'net_amount': 'Net Amount',
      'net_balance': 'Net Balance',
      'client_settings': 'Client Settings',
      'selected_invoices': 'Selected Invoices',
      'selected_payments': 'Selected Payments',
      'selected_quotes': 'Selected Quotes',
      'selected_tasks': 'Selected Tasks',
      'selected_expenses': 'Selected Expenses',
      'upcoming_invoices': 'Upcoming Invoices',
      'past_due_invoices': 'Past Due Invoices',
      'recent_payments': 'Recent Payments',
      'upcoming_quotes': 'Upcoming Quotes',
      'expired_quotes': 'Expired Quotes',
      'create_client': 'Create Client',
      'create_invoice': 'Create Invoice',
      'create_quote': 'Create Quote',
      'create_payment': 'Create Payment',
      'create_vendor': 'Create Vendor',
      'update_quote': 'Update Quote',
      'delete_quote': 'Delete Quote',
      'update_invoice': 'Update Invoice',
      'delete_invoice': 'Delete Invoice',
      'update_client': 'Update Client',
      'delete_client': 'Delete Client',
      'delete_payment': 'Delete Payment',
      'update_vendor': 'Update Vendor',
      'delete_vendor': 'Delete Vendor',
      'create_expense': 'Create Expense',
      'update_expense': 'Update Expense',
      'delete_expense': 'Delete Expense',
      'create_task': 'Create Task',
      'update_task': 'Update Task',
      'delete_task': 'Delete Task',
      'approve_quote': 'Approve Quote',
      'off': 'Off',
      'when_paid': 'When Paid',
      'expires_on': 'Expires On',
      'free': 'Free',
      'plan': 'Plan',
      'show_sidebar': 'Show Sidebar',
      'hide_sidebar': 'Hide Sidebar',
      'event_type': 'Event Type',
      'target_url': 'Target URL',
      'copy': 'Copy',
      'must_be_online': 'Please restart the app once connected to the internet',
      'crons_not_enabled': 'The crons need to be enabled',
      'api_webhooks': 'API Webhooks',
      'search_webhooks': 'Search :count Webhooks',
      'search_webhook': 'Search 1 Webhook',
      'webhook': 'Webhook',
      'webhooks': 'Webhooks',
      'new_webhook': 'New Webhook',
      'edit_webhook': 'Edit Webhook',
      'created_webhook': 'Successfully created webhook',
      'updated_webhook': 'Successfully updated webhook',
      'archived_webhook': 'Successfully archived webhook',
      'deleted_webhook': 'Successfully deleted webhook',
      'removed_webhook': 'Successfully removed webhook',
      'restored_webhook': 'Successfully restored webhook',
      'archived_webhooks': 'Successfully archived :value webhooks',
      'deleted_webhooks': 'Successfully deleted :value webhooks',
      'removed_webhooks': 'Successfully removed :value webhooks',
      'restored_webhooks': 'Successfully restored :value webhooks',
      'api_tokens': 'API Tokens',
      'api_docs': 'API Docs',
      'search_tokens': 'Search :count Tokens',
      'search_token': 'Search 1 Token',
      'token': 'Token',
      'tokens': 'Tokens',
      'new_token': 'New Token',
      'edit_token': 'Edit Token',
      'created_token': 'Successfully created token',
      'updated_token': 'Successfully updated token',
      'archived_token': 'Successfully archived token',
      'deleted_token': 'Successfully deleted token',
      'removed_token': 'Successfully removed token',
      'restored_token': 'Successfully restored token',
      'archived_tokens': 'Successfully archived :value tokens',
      'deleted_tokens': 'Successfully deleted :value tokens',
      'restored_tokens': 'Successfully restored :value tokens',
      'client_registration': 'Client Registration',
      'client_registration_help':
          'Enable clients to self register in the portal',
      'email_invoice': 'Email Invoice',
      'email_quote': 'Email Quote',
      'email_credit': 'Email Credit',
      'email_payment': 'Email Payment',
      'client_email_not_set': 'Client does not have an email address set',
      'ledger': 'Ledger',
      'view_pdf': 'View PDF',
      'all_records': 'All records',
      'owned_by_user': 'Owned by user',
      'credit_remaining': 'Credit Remaining',
      'contact_name': 'Contact Name',
      'use_default': 'Use Default',
      'reminder_endless': 'Endless Reminders',
      'number_of_days': 'Number of days',
      'configure_payment_terms': 'Configure Payment Terms',
      'payment_term': 'Payment Term',
      'new_payment_term': 'New Payment Term',
      'edit_payment_term': 'Edit Payment Term',
      'created_payment_term': 'Successfully created payment term',
      'updated_payment_term': 'Successfully updated payment term',
      'archived_payment_term': 'Successfully archived payment term',
      'deleted_payment_term': 'Successfully deleted payment term',
      'removed_payment_term': 'Successfully removed payment term',
      'restored_payment_term': 'Successfully restored payment term',
      'archived_payment_terms': 'Successfully archived :value payment terms',
      'deleted_payment_terms': 'Successfully deleted :value payment terms',
      'restored_payment_terms': 'Successfully restored :value payment terms',
      'email_sign_in': 'Login with email',
      'change': 'Change',
      'change_to_mobile_layout': 'Change to the mobile layout?',
      'change_to_desktop_layout': 'Change to the desktop layout?',
      'send_from_gmail': 'Send from Gmail',
      'reversed': 'Reversed',
      'cancelled': 'Cancelled',
      'credit_amount': 'Credit Amount',
      'quote_amount': 'Quote Amount',
      'hosted': 'Hosted',
      'selfhosted': 'Self-Hosted',
      'exclusive': 'Exclusive',
      'inclusive': 'Inclusive',
      'hide_menu': 'Hide Menu',
      'show_menu': 'Show Menu',
      'partially_refunded': 'Partially Refunded',
      'search_documents': 'Search :count Documents',
      'search_designs': 'Search :count Designs',
      'search_invoices': 'Search :count Invoices',
      'search_clients': 'Search :count Clients',
      'search_products': 'Search :count Products',
      'search_quotes': 'Search :count Quotes',
      'search_credits': 'Search :count Credits',
      'search_vendors': 'Search :count Vendors',
      'search_users': 'Search :count Users',
      'search_tax_rates': 'Search :count Tax Rates',
      'search_tasks': 'Search :count Tasks',
      'search_settings': 'Search Settings',
      'search_projects': 'Search :count Projects',
      'search_expenses': 'Search :count Expenses',
      'search_payments': 'Search :count Payments',
      'search_groups': 'Search :count Groups',
      'search_company': 'Search Company',
      'search_document': 'Search 1 Document',
      'search_design': 'Search 1 Design',
      'search_invoice': 'Search 1 Invoice',
      'search_client': 'Search 1 Client',
      'search_product': 'Search 1 Product',
      'search_quote': 'Search 1 Quote',
      'search_credit': 'Search 1 Credit',
      'search_vendor': 'Search 1 Vendor',
      'search_user': 'Search 1 User',
      'search_tax_rate': 'Search 1 Tax Rate',
      'search_task': 'Search 1 Tasks',
      'search_project': 'Search 1 Project',
      'search_expense': 'Search 1 Expense',
      'search_payment': 'Search 1 Payment',
      'search_group': 'Search 1 Group',
      'refund_payment': 'Refund Payment',
      'cancelled_invoice': 'Successfully cancelled invoice',
      'cancelled_invoices': 'Successfully cancelled invoices',
      'reversed_invoice': 'Successfully reversed invoice',
      'reversed_invoices': 'Successfully reversed invoices',
      'reverse': 'Reverse',
      'full_name': 'Full Name',
      'city_state_postal': 'City/State/Postal',
      'postal_city_state': 'Postal/City/State',
      'custom1': 'Custom 1',
      'custom2': 'Custom 2',
      'custom3': 'Custom 3',
      'custom4': 'Custom 4',
      'optional': 'Optional',
      'license': 'License',
      'purge_data': 'Purge Data',
      'purge_successful': 'Successfully purged company data',
      'purge_data_message':
          'Warning: This will permanently erase your data, there is no undo.',
      'invoice_balance': 'Invoice Balance',
      'age_group_0': '0 - 30 Days',
      'age_group_30': '30 - 60 Days',
      'age_group_60': '60 - 90 Days',
      'age_group_90': '90 - 120 Days',
      'age_group_120': '120+ Days',
      'refresh': 'Refresh',
      'saved_design': 'Successfully saved design',
      'client_details': 'Client Details',
      'company_address': 'Company Address',
      'invoice_details': 'Invoice Details',
      'quote_details': 'Quote Details',
      'credit_details': 'Credit Details',
      'product_columns': 'Product Columns',
      'task_columns': 'Task Columns',
      'add_field': 'Add Field',
      'all_events': 'All Events',
      'permissions': 'Permissions',
      'none': 'None',
      'owned': 'Owned',
      'payment_success': 'Payment Success',
      'payment_failure': 'Payment Failure',
      'invoice_sent': 'Invoice Sent',
      'quote_sent': 'Quote Sent',
      'credit_sent': 'Credit Sent',
      'invoice_viewed': 'Invoice Viewed',
      'quote_viewed': 'Quote Viewed',
      'credit_viewed': 'Credit Viewed',
      'quote_approved': 'Quote Approved',
      'receive_all_notifications': 'Receive All Notifications',
      'purchase_license': 'Purchase License',
      'apply_license': 'Apply License',
      'cancel_account': 'Delete Account',
      'cancel_account_message':
          'Warning: This will permanently delete your account [:company], there is no undo',
      'delete_company': 'Delete Company',
      'delete_company_message':
          'Warning: This will permanently delete your company [:company], there is no undo',
      'enabled_modules': 'Enabled Modules',
      'converted_quote': 'Successfully converted quote',
      'credit_design': 'Credit Design',
      'includes': 'Includes',
      'header': 'Header',
      'load_design': 'Load Design',
      'css_framework': 'CSS Framework',
      'custom_designs': 'Custom Designs',
      'designs': 'Designs',
      'new_design': 'New Design',
      'edit_design': 'Edit Design',
      'created_design': 'Successfully created design',
      'updated_design': 'Successfully updated design',
      'archived_design': 'Successfully archived design',
      'deleted_design': 'Successfully deleted design',
      'removed_design': 'Successfully removed design',
      'restored_design': 'Successfully restored design',
      'archived_designs': 'Successfully archived :value designs',
      'deleted_designs': 'Successfully deleted :value designs',
      'restored_designs': 'Successfully restored :value designs',
      'proposals': 'Proposals',
      'tickets': 'Tickets',
      'recurring_quotes': 'Recurring Quotes',
      'recurring_tasks': 'Recurring Tasks',
      'account_management': 'Account Management',
      'credit_date': 'Credit Date',
      'credit': 'Credit',
      'credits': 'Credits',
      'new_credit': 'New Credit',
      'edit_credit': 'Edit Credit',
      'created_credit': 'Successfully created credit',
      'updated_credit': 'Successfully updated credit',
      'archived_credit': 'Successfully archived credit',
      'deleted_credit': 'Successfully deleted credit',
      'removed_credit': 'Successfully removed credit',
      'restored_credit': 'Successfully restored credit',
      'archived_credits': 'Successfully archived :value credits',
      'deleted_credits': 'Successfully deleted :value credits',
      'restored_credits': 'Successfully restored :value credits',
      'current_version': 'Current Version',
      'latest_version': 'Latest Version',
      'update_now': 'Update Now',
      'a_new_version_is_available': 'A new version of the web app is available',
      'update_available': 'Update Available',
      'app_updated': 'Update successfully completed',
      'learn_more': 'Learn More',
      'integrations': 'Integrations',
      'tracking_id': 'Tracking ID',
      'slack_webhook_url': 'Slack Webhook URL',
      'credit_footer': 'Credit Footer',
      'credit_terms': 'Credit Terms',
      'new_company': 'New Company',
      'added_company': 'Successfully added company',
      'company1': 'Custom Company 1',
      'company2': 'Custom Company 2',
      'company3': 'Custom Company 3',
      'company4': 'Custom Company 4',
      'product1': 'Custom Product 1',
      'product2': 'Custom Product 2',
      'product3': 'Custom Product 3',
      'product4': 'Custom Product 4',
      'product5': 'Custom Product 5',
      'product6': 'Custom Product 6',
      'product7': 'Custom Product 7',
      'product8': 'Custom Product 8',
      'client1': 'Custom Client 1',
      'client2': 'Custom Client 2',
      'client3': 'Custom Client 3',
      'client4': 'Custom Client 4',
      'contact1': 'Custom Contact 1',
      'contact2': 'Custom Contact 2',
      'contact3': 'Custom Contact 3',
      'contact4': 'Custom Contact 4',
      'task1': 'Custom Task 1',
      'task2': 'Custom Task 2',
      'task3': 'Custom Task 3',
      'task4': 'Custom Task 4',
      'project1': 'Custom Project 1',
      'project2': 'Custom Project 2',
      'project3': 'Custom Project 3',
      'project4': 'Custom Project 4',
      'expense1': 'Custom Expense 1',
      'expense2': 'Custom Expense 2',
      'expense3': 'Custom Expense 3',
      'expense4': 'Custom Expense 4',
      'vendor1': 'Custom Vendor 1',
      'vendor2': 'Custom Vendor 2',
      'vendor3': 'Custom Vendor 3',
      'vendor4': 'Custom Vendor 4',
      'invoice1': 'Custom Invoice 1',
      'invoice2': 'Custom Invoice 2',
      'invoice3': 'Custom Invoice 3',
      'invoice4': 'Custom Invoice 4',
      'invoice5': 'Custom Invoice 5',
      'invoice6': 'Custom Invoice 6',
      'invoice7': 'Custom Invoice 7',
      'invoice8': 'Custom Invoice 8',
      'payment1': 'Custom Payment 1',
      'payment2': 'Custom Payment 2',
      'payment3': 'Custom Payment 3',
      'payment4': 'Custom Payment 4',
      'surcharge1': 'Custom Surcharge 1',
      'surcharge2': 'Custom Surcharge 2',
      'surcharge3': 'Custom Surcharge 3',
      'surcharge4': 'Custom Surcharge 4',
      'group1': 'Custom Group 1',
      'group2': 'Custom Group 2',
      'group3': 'Custom Group 3',
      'group4': 'Custom Group 4',
      'reset': 'Reset',
      'number': 'Number',
      'export': 'Export',
      'chart': 'Chart',
      'count': 'Count',
      'totals': 'Totals',
      'blank': 'Blank',
      'day': 'Day',
      'month': 'Month',
      'year': 'Year',
      'subgroup': 'Subgroup',
      'is_active': 'Is Active',
      'group_by': 'Group By',
      'credit_balance': 'Credit Balance',
      'contact_last_login': 'Contact Last Login',
      'contact_full_name': 'Contact Full Name',
      'contact_phone': 'Contact Phone',
      'contact_custom_value1': 'Contact Custom Value 1',
      'contact_custom_value2': 'Contact Custom Value 2',
      'contact_custom_value3': 'Contact Custom Value 3',
      'contact_custom_value4': 'Contact Custom Value 4',
      'shipping_address1': 'Shipping Street',
      'shipping_address2': 'Shipping Apt/Suite',
      'shipping_city': 'Shipping City',
      'shipping_state': 'Shipping State/Province',
      'shipping_postal_code': 'Shipping Postal Code',
      'shipping_country': 'Shipping Country',
      'billing_address1': 'Billing Street',
      'billing_address2': 'Billing Apt/Suite',
      'billing_city': 'Billing City',
      'billing_state': 'Billing State/Province',
      'billing_postal_code': 'Billing Postal Code',
      'billing_country': 'Billing Country',
      'client_id': 'Client ID',
      'assigned_to': 'Assigned To',
      'created_by': 'Created By',
      'assigned_to_id': 'Assigned To ID',
      'created_by_id': 'Created By ID',
      'add_column': 'Add Column',
      'edit_columns': 'Edit Columns',
      'columns': 'Columns',
      'aging': 'Aging',
      'profit_and_loss': 'Profit and Loss',
      'reports': 'Reports',
      'report': 'Report',
      'add_company': 'Add Company',
      'unpaid_invoice': 'Unpaid Invoice',
      'paid_invoice': 'Paid Invoice',
      'unapproved_quote': 'Unapproved Quote',
      'help': 'Help',
      'refund': 'Refund',
      'refund_date': 'Refund Date',
      'filtered_by': 'Filtered by :value',
      'contact_email': 'Contact Email',
      'multiselect': 'Multiselect',
      'entity_state': 'Entity State',
      'verify_password': 'Verify Password',
      'applied': 'Applied',
      'include_recent_errors': 'Include recent errors from the logs',
      'your_message_has_been_received':
          'We have received your message and will try to respond promptly.',
      'message': 'Message',
      'from': 'From',
      'show_product_details': 'Show Product Details',
      'show_product_details_help':
          'Include the description and cost in the product dropdown',
      'pdf_min_requirements': 'The PDF renderer requires :version',
      'adjust_fee_percent': 'Adjust Fee Percent',
      'adjust_fee_percent_help': 'Ensure client fee matches the gateway fee',
      'configure_settings': 'Configure Settings',
      'support_forum': 'Support Forum',
      'about': 'About',
      'documentation': 'Documentation',
      'contact_us': 'Contact Us',
      'subtotal': 'Subtotal',
      'line_total': 'Line Total',
      'item': 'Item',
      'credit_email': 'Credit Email',
      'iframe_url': 'iFrame URL',
      'domain_url': 'Domain URL',
      'password_is_too_short': 'Password must be at least 8 character long',
      'password_is_too_easy':
          'Password must contain an upper case character and a number',
      'client_portal_tasks': 'Client Portal Tasks',
      'client_portal_dashboard': 'Client Portal Dashboard',
      'please_enter_a_value': 'Please enter a value',
      'deleted_logo': 'Successfully deleted logo',
      'yes': 'Yes',
      'no': 'No',
      'generate_number': 'Generate Number',
      'when_saved': 'When Saved',
      'when_sent': 'When Sent',
      'select_company': 'Select Company',
      'float': 'Float',
      'collapse': 'Collapse',
      'show_or_hide': 'Show/hide',
      'menu_sidebar': 'Menu Sidebar',
      'history_sidebar': 'History Sidebar',
      'tablet': 'Tablet',
      'mobile': 'Mobile',
      'desktop': 'Desktop',
      'layout': 'Layout',
      'view': 'View',
      'module': 'Module',
      'first_custom': 'First Custom',
      'second_custom': 'Second Custom',
      'third_custom': 'Third Custom',
      'show_cost': 'Show Cost',
      'show_product_cost': 'Show Product Cost',
      'show_cost_help':
          'Display a product cost field to track the markup/profit',
      'show_product_quantity': 'Show Product Quantity',
      'show_product_quantity_help':
          'Display a product quantity field, otherwise default to one',
      'show_invoice_quantity': 'Show Invoice Quantity',
      'show_invoice_quantity_help':
          'Display a line item quantity field, otherwise default to one',
      'show_product_discount': 'Show Product Discount',
      'show_product_discount_help': 'Display a line item discount field',
      'default_quantity': 'Default Quantity',
      'default_quantity_help':
          'Automatically set the line item quantity to one',
      'one_tax_rate': 'One Tax Rate',
      'two_tax_rates': 'Two Tax Rates',
      'three_tax_rates': 'Three Tax Rates',
      'default_tax_rate': 'Default Tax Rate',
      'user': 'User',
      'invoice_tax': 'Invoice Tax',
      'line_item_tax': 'Line Item Tax',
      'inclusive_taxes': 'Inclusive Taxes',
      'invoice_tax_rates': 'Invoice Tax Rates',
      'item_tax_rates': 'Item Tax Rates',
      'no_client_selected': 'No client selected',
      'configure_rates': 'Configure Rates',
      'configure_gateways': 'Configure Gateways',
      'tax_settings': 'Tax Settings',
      'tax_settings_rates': 'Tax Rates',
      'accent_color': 'Accent Color',
      'switch': 'Switch',
      'comma_sparated_list': 'Comma separated list',
      'options': 'Options',
      'single_line_text': 'Single-line text',
      'multi_line_text': 'Multi-line text',
      'dropdown': 'Dropdown',
      'field_type': 'Field Type',
      'recover_password_email_sent': 'A password recovery email has been sent',
      'submit': 'Submit',
      'recover_password': 'Recover Password',
      'late_fees': 'Late Fees',
      'credit_number': 'Credit Number',
      'payment_number': 'Payment Number',
      'late_fee_amount': 'Late Fee Amount',
      'late_fee_percent': 'Late Fee Percent',
      'before_due_date': 'Before the due date',
      'after_due_date': 'After the due date',
      'after_invoice_date': 'After the invoice date',
      'days': 'Days',
      'invoice_email': 'Invoice Email',
      'payment_email': 'Payment Email',
      'partial_payment': 'Partial Payment',
      'payment_partial': 'Partial Payment',
      'partial_payment_email': 'Partial Payment Email',
      'quote_email': 'Quote Email',
      'endless_reminder': 'Endless Reminder',
      'filtered_by_user': 'Filtered by User',
      'administrator': 'Administrator',
      'administrator_help':
          'Allow user to manage users, change settings and modify all records',
      'user_management': 'User Management',
      'users': 'Users',
      'new_user': 'New User',
      'edit_user': 'Edit User',
      'created_user': 'Successfully created user',
      'updated_user': 'Successfully updated user',
      'archived_user': 'Successfully archived user',
      'deleted_user': 'Successfully deleted user',
      'removed_user': 'Successfully removed user',
      'restored_user': 'Successfully restored user',
      'archived_users': 'Successfully archived :value users',
      'deleted_users': 'Successfully deleted :value users',
      'removed_users': 'Successfully removed :value users',
      'restored_users': 'Successfully restored :value users',
      'general_settings': 'General Settings',
      'invoice_options': 'Invoice Options',
      'hide_paid_to_date': 'Hide Paid to Date',
      'hide_paid_to_date_help':
          'Only display the \'Paid to Date\' area on your invoices once a payment has been received.',
      'invoice_embed_documents': 'Embed Documents',
      'invoice_embed_documents_help': 'Include attached images in the invoice.',
      'all_pages_header': 'Show Header on',
      'all_pages_footer': 'Show Footer on',
      'first_page': 'First page',
      'all_pages': 'All pages',
      'last_page': 'Last page',
      'primary_font': 'Primary Font',
      'secondary_font': 'Secondary Font',
      'primary_color': 'Primary Color',
      'secondary_color': 'Secondary Color',
      'page_size': 'Page Size',
      'font_size': 'Font Size',
      'quote_design': 'Quote Design',
      'invoice_fields': 'Invoice Fields',
      'product_fields': 'Product Fields',
      'invoice_terms': 'Invoice Terms',
      'invoice_footer': 'Invoice Footer',
      'quote_terms': 'Quote Terms',
      'quote_footer': 'Quote Footer',
      'auto_email_invoice': 'Auto Email',
      'auto_email_invoice_help':
          'Automatically email recurring invoices when they are created.',
      'auto_archive_quote': 'Auto Archive',
      'auto_archive_quote_help':
          'Automatically archive quotes when they are converted.',
      'auto_convert_quote': 'Auto Convert',
      'auto_convert_quote_help':
          'Automatically convert a quote to an invoice when approved by a client.',
      'workflow_settings': 'Workflow Settings',
      'freq_daily': 'Daily',
      'freq_weekly': 'Weekly',
      'freq_two_weeks': 'Two Weeks',
      'freq_four_weeks': 'Four Weeks',
      'freq_monthly': 'Monthly',
      'freq_two_months': 'Two Months',
      'freq_three_months': 'Three Months',
      'freq_four_months': 'Four Months',
      'freq_six_months': 'Six Months',
      'freq_annually': 'Annually',
      'freq_two_years': 'Two Years',
      'freq_three_years': 'Three Years',
      'never': 'Never',
      'company': 'Company',
      'generated_numbers': 'Generated Numbers',
      'charge_taxes': 'Charge Taxes',
      'next_reset': 'Next Reset',
      'reset_counter': 'Reset Counter',
      'recurring_prefix': 'Recurring Prefix',
      'number_padding': 'Number Padding',
      'general': 'General',
      'surcharge_field': 'Surcharge Field',
      'company_field': 'Company Field',
      'company_value': 'Company Value',
      'credit_field': 'Credit Field',
      'invoice_field': 'Invoice Field',
      'invoice_surcharge': 'Invoice Surcharge',
      'client_field': 'Client Field',
      'product_field': 'Product Field',
      'payment_field': 'Payment Field',
      'contact_field': 'Contact Field',
      'vendor_field': 'Vendor Field',
      'expense_field': 'Expense Field',
      'project_field': 'Project Field',
      'task_field': 'Task Field',
      'group_field': 'Group Field',
      'number_counter': 'Number Counter',
      'prefix': 'Prefix',
      'number_pattern': 'Number Pattern',
      'messages': 'Messages',
      'custom_css': 'Custom CSS',
      'custom_javascript': 'Custom JavaScript',
      'signature_on_pdf': 'Show on PDF',
      'signature_on_pdf_help':
          'Show the client signature on the invoice/quote PDF.',
      'show_accept_invoice_terms': 'Invoice Terms Checkbox',
      'show_accept_invoice_terms_help':
          'Require client to confirm that they accept the invoice terms.',
      'show_accept_quote_terms': 'Quote Terms Checkbox',
      'show_accept_quote_terms_help':
          'Require client to confirm that they accept the quote terms.',
      'require_invoice_signature': 'Invoice Signature',
      'require_invoice_signature_help':
          'Require client to provide their signature.',
      'require_quote_signature': 'Quote Signature',
      'enable_portal_password': 'Password Protect Invoices',
      'enable_portal_password_help':
          'If enabled the contact will be able to set a password when viewing their first invoice.',
      'authorization': 'Authorization',
      'subdomain': 'Subdomain',
      'domain': 'Domain',
      'portal_mode': 'Portal Mode',
      'email_signature': 'Email Signature',
      'enable_email_markup_help':
          'Make it easier for your clients to pay you by adding schema.org markup to your emails.',
      'plain': 'Plain',
      'light': 'Light',
      'dark': 'Dark',
      'email_design': 'Email Design',
      'attach_pdf': 'Attach PDF',
      'attach_documents': 'Attach Documents',
      'attach_ubl': 'Attach UBL',
      'email_style': 'Email Style',
      'enable_email_markup': 'Enable Markup',
      'reply_to_email': 'Reply-To Email',
      'reply_to_name': 'Reply-To Name',
      'bcc_email': 'BCC Email',
      'processed': 'Processed',
      'credit_card': 'Credit Card',
      'bank_transfer': 'Bank Transfer',
      'priority': 'Priority',
      'fee_amount': 'Fee Amount',
      'fee_percent': 'Fee Percent',
      'fee_cap': 'Fee Cap',
      'limits_and_fees': 'Limits/Fees',
      'enable_min': 'Enable Min',
      'enable_max': 'Enable Max',
      'min_limit': 'Min Limit',
      'max_limit': 'Max Limit',
      'min': 'Min',
      'max': 'Max',
      'accepted_card_logos': 'Accepted Card Logos',
      'credentials': 'Credentials',
      'update_address': 'Update Address',
      'update_address_help': 'Update client\'s address with provided details',
      'rate': 'Rate',
      'tax_rate': 'Tax Rate',
      'new_tax_rate': 'New Tax Rate',
      'edit_tax_rate': 'Edit Tax Rate',
      'created_tax_rate': 'Successfully created tax rate',
      'updated_tax_rate': 'Successfully updated tax rate',
      'archived_tax_rate': 'Successfully archived tax rate',
      'deleted_tax_rate': 'Successfully deleted tax rate',
      'restored_tax_rate': 'Successfully restored tax rate',
      'archived_tax_rates': 'Successfully archived :value tax rates',
      'deleted_tax_rates': 'Successfully deleted :value tax rates',
      'restored_tax_rates': 'Successfully restored :value tax rates',
      'fill_products': 'Fill Products',
      'fill_products_help':
          'Selecting a product will automatically fill in the description and cost',
      'update_products': 'Update Products',
      'update_products_help':
          'Updating an invoice will automatically update the product library',
      'convert_products': 'Convert Products',
      'convert_products_help':
          'Automatically convert product prices using current exchange rate',
      'fees': 'Fees',
      'limits': 'Limits',
      'provider': 'Provider',
      'company_gateway': 'Gateway',
      'company_gateways': 'Payment Gateways',
      'new_company_gateway': 'New Gateway',
      'edit_company_gateway': 'Edit Gateway',
      'created_company_gateway': 'Successfully created gateway',
      'updated_company_gateway': 'Successfully updated gateway',
      'archived_company_gateway': 'Successfully archived gateway',
      'deleted_company_gateway': 'Successfully deleted gateway',
      'restored_company_gateway': 'Successfully restored gateway',
      'archived_company_gateways': 'Successfully archived :value gateways',
      'deleted_company_gateways': 'Successfully deleted :value gateways',
      'restored_company_gateways': 'Successfully restored :value gateways',
      'continue_editing': 'Continue Editing',
      'discard_changes': 'Discard Changes',
      'default_value': 'Default value',
      'disabled': 'Disabled',
      'currency_format': 'Currency Format',
      'first_day_of_the_week': 'First Day of the Week',
      'first_month_of_the_year': 'First Month of the Year',
      'sunday': 'Sunday',
      'monday': 'Monday',
      'tuesday': 'Tuesday',
      'wednesday': 'Wednesday',
      'thursday': 'Thursday',
      'friday': 'Friday',
      'saturday': 'Saturday',
      'january': 'January',
      'february': 'February',
      'march': 'March',
      'april': 'April',
      'may': 'May',
      'june': 'June',
      'july': 'July',
      'august': 'August',
      'september': 'September',
      'october': 'October',
      'november': 'November',
      'december': 'December',
      'symbol': 'Symbol',
      'ocde': 'Code',
      'date_format': 'Date Format',
      'datetime_format': 'Datetime Format',
      'military_time': 'Military Time',
      'military_time_help': '24 Hour Display',
      'send_reminders': 'Send Reminders',
      'timezone': 'Timezone',
      'filtered_by_project': 'Filtered by Project',
      'filtered_by_group': 'Filtered by Group',
      'filtered_by_invoice': 'Filtered by Invoice',
      'filtered_by_client': 'Filtered by Client',
      'filtered_by_vendor': 'Filtered by Vendor',
      'group_settings': 'Group Settings',
      'group': 'Group',
      'groups': 'Groups',
      'new_group': 'New Group',
      'edit_group': 'Edit Group',
      'created_group': 'Successfully created group',
      'updated_group': 'Successfully updated group',
      'archived_groups': 'Successfully archived :value groups',
      'deleted_groups': 'Successfully deleted :value groups',
      'restored_groups': 'Successfully restored :value groups',
      'archived_group': 'Successfully archived group',
      'deleted_group': 'Successfully deleted group',
      'restored_group': 'Successfully restored group',
      'upload_logo': 'Upload Logo',
      'uploaded_logo': 'Successfully uploaded logo',
      'logo': 'Logo',
      'saved_settings': 'Successfully saved settings',
      'product_settings': 'Product Settings',
      'device_settings': 'Device Settings',
      'defaults': 'Defaults',
      'basic_settings': 'Basic Settings',
      'advanced_settings': 'Advanced Settings',
      'company_details': 'Company Details',
      'user_details': 'User Details',
      'localization': 'Localization',
      'online_payments': 'Online Payments',
      'tax_rates': 'Tax Rates',
      'notifications': 'Notifications',
      'import_export': 'Import | Export',
      'custom_fields': 'Custom Fields',
      'invoice_design': 'Invoice Design',
      'buy_now_buttons': 'Buy Now Buttons',
      'email_settings': 'Email Settings',
      'templates_and_reminders': 'Templates & Reminders',
      'credit_cards_and_banks': 'Credit Cards & Banks',
      'data_visualizations': 'Data Visualizations',
      'price': 'Price',
      'email_sign_up': 'Sign up with email',
      'google_sign_up': 'Sign up with Google',
      'thank_you_for_your_purchase': 'Thank you for your purchase!',
      'redeem': 'Redeem',
      'back': 'Back',
      'past_purchases': 'Past Purchases',
      'annual_subscription': 'Annual Subscription',
      'pro_plan': 'Pro Plan',
      'enterprise_plan': 'Enterprise Plan',
      'count_users': ':count users',
      'upgrade': 'Upgrade',
      'please_enter_a_first_name': 'Please enter a first name',
      'please_enter_a_last_name': 'Please enter a last name',
      'please_agree_to_terms_and_privacy':
          'Please agree to the terms of service and privacy policy to create an account.',
      'i_agree_to_the': 'I agree to the',
      'terms_of_service': 'Terms of Service',
      'privacy_policy': 'Privacy Policy',
      'sign_up': 'Sign Up',
      'account_login': 'Account Login',
      'view_website': 'View Website',
      'create_account': 'Create Account',
      'email_login': 'Email Login',
      'create_new': 'Create New',
      'no_record_selected': 'No record selected',
      'error_unsaved_changes': 'Please save or cancel your changes',
      'download': 'Download',
      'requires_an_enterprise_plan': 'Requires an Enterprise plan',
      'take_picture': 'Take Picture',
      'upload_files': 'Upload Files',
      'document': 'Document',
      'documents': 'Documents',
      'new_document': 'New Document',
      'edit_document': 'Edit Document',
      'uploaded_document': 'Successfully uploaded document',
      'updated_document': 'Successfully updated document',
      'archived_document': 'Successfully archived document',
      'deleted_document': 'Successfully deleted document',
      'restored_document': 'Successfully restored document',
      'archived_documents': 'Successfully archived :value documents',
      'deleted_documents': 'Successfully deleted :value documents',
      'restored_documents': 'Successfully restored :value documents',
      'no_history': 'No History',
      'expense_date': 'Expense Date',
      'pending': 'Pending',
      'expense_status_1': 'Logged',
      'expense_status_2': 'Pending',
      'expense_status_3': 'Invoiced',
      'converted': 'Converted',
      'add_documents_to_invoice': 'Add Documents to Invoice',
      'exchange_rate': 'Exchange Rate',
      'convert_currency': 'Convert Currency',
      'mark_paid': 'Mark Paid',
      'category': 'Category',
      'address': 'Address',
      'new_vendor': 'New Vendor',
      'created_vendor': 'Successfully created vendor',
      'updated_vendor': 'Successfully updated vendor',
      'archived_vendor': 'Successfully archived vendor',
      'deleted_vendor': 'Successfully deleted vendor',
      'restored_vendor': 'Successfully restored vendor',
      'archived_vendors': 'Successfully archived :value vendors',
      'deleted_vendors': 'Successfully deleted :value vendors',
      'restored_vendors': 'Successfully restored :value vendors',
      'new_expense': 'New Expense',
      'created_expense': 'Successfully created expense',
      'updated_expense': 'Successfully updated expense',
      'archived_expense': 'Successfully archived expense',
      'deleted_expense': 'Successfully deleted expense',
      'restored_expense': 'Successfully restored expense',
      'archived_expenses': 'Successfully archived :value expenses',
      'deleted_expenses': 'Successfully deleted :value expenses',
      'restored_expenses': 'Successfully restored :value expenses',
      'copy_shipping': 'Copy Shipping',
      'copy_billing': 'Copy Billing',
      'design': 'Design',
      'failed_to_find_record': 'Failed to find record',
      'invoiced': 'Invoiced',
      'logged': 'Logged',
      'running': 'Running',
      'resume': 'Resume',
      'task_errors': 'Please correct any overlapping times',
      'start': 'Start',
      'stop': 'Stop',
      'started_task': 'Successfully started task',
      'stopped_task': 'Successfully stopped task',
      'resumed_task': 'Successfully resumed task',
      'now': 'Now',
      'auto_start_tasks': 'Auto Start Tasks',
      'timer': 'Timer',
      'manual': 'Manual',
      'budgeted': 'Budgeted',
      'start_time': 'Start Time',
      'end_time': 'End Time',
      'date': 'Date',
      'times': 'Times',
      'duration': 'Duration',
      'new_task': 'New Task',
      'created_task': 'Successfully created task',
      'updated_task': 'Successfully updated task',
      'archived_task': 'Successfully archived task',
      'deleted_task': 'Successfully deleted task',
      'restored_task': 'Successfully restored task',
      'archived_tasks': 'Successfully archived :value tasks',
      'deleted_tasks': 'Successfully deleted :value tasks',
      'restored_tasks': 'Successfully restored :value tasks',
      'please_enter_a_name': 'Please enter a name',
      'budgeted_hours': 'Budgeted Hours',
      'created_project': 'Successfully created project',
      'updated_project': 'Successfully updated project',
      'archived_project': 'Successfully archived project',
      'deleted_project': 'Successfully deleted project',
      'restored_project': 'Successfully restored project',
      'archived_projects': 'Successfully archived :value projects',
      'deleted_projects': 'Successfully deleted :value projects',
      'restored_projects': 'Successfully restored :value projects',
      'new_project': 'New Project',
      'thank_you_for_using_our_app': 'Thank you for using our app!',
      'if_you_like_it': 'If you like it please',
      'click_here': 'click here',
      'click_here_capital': 'Click here',
      'to_rate_it': 'to rate it.',
      'average': 'Average',
      'unapproved': 'Unapproved',
      'authenticate_to_change_setting':
          'Please authenticate to change this setting',
      'locked': 'Locked',
      'authenticate': 'Authenticate',
      'please_authenticate': 'Please authenticate',
      'biometric_authentication': 'Biometric Authentication',
      'footer': 'Footer',
      'compare': 'Compare',
      'hosted_login': 'Hosted Login',
      'selfhost_login': 'Selfhost Login',
      'google_sign_in': 'Login with Google',
      'today': 'Today',
      'custom_range': 'Custom',
      'date_range': 'Date Range',
      'current': 'Current',
      'previous': 'Previous',
      'current_period': 'Current Period',
      'comparison_period': 'Comparison Period',
      'previous_period': 'Previous Period',
      'previous_year': 'Previous Year',
      'compare_to': 'Compare to',
      'last7_days': 'Last 7 Days',
      'last_week': 'Last Week',
      'last30_days': 'Last 30 Days',
      'this_month': 'This Month',
      'last_month': 'Last Month',
      'this_year': 'This Year',
      'last_year': 'Last Year',
      'all_time': 'All Time',
      'custom': 'Custom',
      'clone_to_invoice': 'Clone to Invoice',
      'clone_to_quote': 'Clone to Quote',
      'clone_to_credit': 'Clone to Credit',
      'view_invoice': 'View Invoice',
      'convert': 'Convert',
      'more': 'More',
      'edit_client': 'Edit Client',
      'edit_product': 'Edit Product',
      'edit_invoice': 'Edit Invoice',
      'edit_quote': 'Edit Quote',
      'edit_payment': 'Edit Payment',
      'edit_task': 'Edit Task',
      'edit_expense': 'Edit Expense',
      'edit_vendor': 'Edit Vendor',
      'edit_project': 'Edit Project',
      'edit_recurring_quote': 'Edit Recurring Quote',
      'billing_address': 'Billing Address',
      'shipping_address': 'Shipping Address',
      'total_revenue': 'Total Revenue',
      'average_invoice': 'Average Invoice',
      'outstanding': 'Outstanding',
      'invoices_sent': 'Invoices Sent',
      'active_clients': 'Active Clients',
      'close': 'Close',
      'email': 'Email',
      'password': 'Password',
      'url': 'URL',
      'secret': 'Secret',
      'name': 'Name',
      'logout': 'Log Out',
      'login': 'Login',
      'filter': 'Filter',
      'sort': 'Sort',
      'search': 'Search',
      'active': 'Active',
      'archived': 'Archived',
      'deleted': 'Deleted',
      'dashboard': 'Dashboard',
      'archive': 'Archive',
      'delete': 'Delete',
      'restore': 'Restore',
      'refresh_complete': 'Refresh Complete',
      'please_enter_your_email': 'Please enter your email',
      'please_enter_your_password': 'Please enter your password',
      'please_enter_your_url': 'Please enter your URL',
      'please_enter_a_product_key': 'Please enter a product key',
      'ascending': 'Ascending',
      'descending': 'Descending',
      'save': 'Save',
      'an_error_occurred': 'An error occurred',
      'paid_to_date': 'Paid to Date',
      'balance_due': 'Balance Due',
      'balance': 'Balance',
      'overview': 'Overview',
      'details': 'Details',
      'phone': 'Phone',
      'website': 'Website',
      'vat_number': 'VAT Number',
      'id_number': 'ID Number',
      'create': 'Create',
      'copied_to_clipboard': 'Copied :value to the clipboard',
      'error': 'Error',
      'could_not_launch': 'Could not launch',
      'contacts': 'Contacts',
      'additional': 'Additional',
      'first_name': 'First Name',
      'last_name': 'Last Name',
      'add_contact': 'Add Contact',
      'are_you_sure': 'Are you sure?',
      'cancel': 'Cancel',
      'ok': 'Ok',
      'remove': 'Remove',
      'email_is_invalid': 'Email is invalid',
      'product': 'Product',
      'products': 'Products',
      'new_product': 'New Product',
      'created_product': 'Successfully created product',
      'updated_product': 'Successfully updated product',
      'archived_product': 'Successfully archived product',
      'deleted_product': 'Successfully deleted product',
      'restored_product': 'Successfully restored product',
      'archived_products': 'Successfully archived :value products',
      'deleted_products': 'Successfully deleted :value products',
      'restored_products': 'Successfully restored :value products',
      'product_key': 'Product',
      'notes': 'Notes',
      'cost': 'Cost',
      'client': 'Client',
      'clients': 'Clients',
      'new_client': 'New Client',
      'created_client': 'Successfully created client',
      'updated_client': 'Successfully updated client',
      'archived_client': 'Successfully archived client',
      'archived_clients': 'Successfully archived :value clients',
      'deleted_client': 'Successfully deleted client',
      'deleted_clients': 'Successfully deleted :value clients',
      'restored_client': 'Successfully restored client',
      'restored_clients': 'Successfully restored :value clients',
      'address1': 'Street',
      'address2': 'Apt/Suite',
      'city': 'City',
      'state': 'State/Province',
      'postal_code': 'Postal Code',
      'country': 'Country',
      'invoice': 'Invoice',
      'invoices': 'Invoices',
      'new_invoice': 'New Invoice',
      'created_invoice': 'Successfully created invoice',
      'updated_invoice': 'Successfully updated invoice',
      'archived_invoice': 'Successfully archived invoice',
      'deleted_invoice': 'Successfully deleted invoice',
      'restored_invoice': 'Successfully restored invoice',
      'archived_invoices': 'Successfully archived :value invoices',
      'deleted_invoices': 'Successfully deleted :value invoices',
      'restored_invoices': 'Successfully restored :value invoices',
      'emailed_invoice': 'Successfully queued invoice to be sent',
      'emailed_payment': 'Successfully queued payment to be sent',
      'amount': 'Amount',
      'invoice_number': 'Invoice Number',
      'invoice_date': 'Invoice Date',
      'discount': 'Discount',
      'po_number': 'PO Number',
      'terms': 'Terms',
      'public_notes': 'Public Notes',
      'private_notes': 'Private Notes',
      'frequency': 'Frequency',
      'start_date': 'Start Date',
      'end_date': 'End Date',
      'quote_number': 'Quote Number',
      'quote_date': 'Quote Date',
      'valid_until': 'Valid Until',
      'items': 'Items',
      'partial_deposit': 'Partial/Deposit',
      'description': 'Description',
      'unit_cost': 'Unit Cost',
      'quantity': 'Quantity',
      'add_item': 'Add Item',
      'contact': 'Contact',
      'work_phone': 'Phone',
      'total_amount': 'Total Amount',
      'pdf': 'PDF',
      'due_date': 'Due Date',
      'partial_due_date': 'Partial Due Date',
      'paid_date': 'Paid Date',
      'status': 'Status',
      'invoice_status_id': 'Invoice Status',
      'quote_status': 'Quote Status',
      'click_plus_to_add_item': 'Click + to add an item',
      'click_plus_to_add_time': 'Click ▶ to add time',
      'count_selected': ':count selected',
      'total': 'Total',
      'percent': 'Percent',
      'edit': 'Edit',
      'dismiss': 'Dismiss',
      'please_select_a_date': 'Please select a date',
      'please_select_a_client': 'Please select a client',
      'please_select_an_invoice': 'Please select an invoice',
      'task_rate': 'Task Rate',
      'settings': 'Settings',
      'language': 'Language',
      'currency': 'Currency',
      'created_at': 'Created At',
      'created_on': 'Created On',
      'updated_at': 'Updated At',
      'tax': 'Tax',
      'please_enter_an_invoice_number': 'Please enter an invoice number',
      'please_enter_a_quote_number': 'Please enter a quote number',
      'past_due': 'Past Due',
      'draft': 'Draft',
      'sent': 'Sent',
      'viewed': 'Viewed',
      'approved': 'Approved',
      'partial': 'Partial',
      'paid': 'Paid',
      'mark_sent': 'Mark Sent',
      'marked_invoice_as_sent': 'Successfully marked invoice as sent',
      'marked_invoice_as_paid': 'Successfully marked invoice as paid',
      'marked_invoices_as_sent': 'Successfully marked invoices as sent',
      'marked_invoices_as_paid': 'Successfully marked invoices as paid',
      'done': 'Done',
      'please_enter_a_client_or_contact_name':
          'Please enter a client or contact name',
      'dark_mode': 'Dark Mode',
      'restart_app_to_apply_change': 'Restart the app to apply the change',
      'refresh_data': 'Refresh Data',
      'blank_contact': 'Blank Contact',
      'activity': 'Activity',
      'no_records_found': 'No records found',
      'clone': 'Clone',
      'loading': 'Loading',
      'industry': 'Industry',
      'size': 'Size',
      'payment_terms': 'Payment Terms',
      'payment_date': 'Payment Date',
      'payment_status': 'Payment Status',
      'payment_status_1': 'Pending',
      'payment_status_2': 'Cancelled',
      'payment_status_3': 'Failed',
      'payment_status_4': 'Completed',
      'payment_status_5': 'Partially Refunded',
      'payment_status_6': 'Refunded',
      'payment_status_-1': 'Unapplied',
      'payment_status_-2': 'Partially Unapplied',
      'net': 'Net',
      'client_portal': 'Client Portal',
      'show_tasks': 'Show tasks',
      'email_reminders': 'Email Reminders',
      'enabled': 'Enabled',
      'recipients': 'Recipients',
      'initial_email': 'Initial Email',
      'first_reminder': 'First Reminder',
      'second_reminder': 'Second Reminder',
      'third_reminder': 'Third Reminder',
      'reminder1': 'Reminder 1',
      'reminder2': 'Reminder 2',
      'reminder3': 'Reminder 3',
      'template': 'Template',
      'send': 'Send',
      'subject': 'Subject',
      'body': 'Body',
      'send_email': 'Send Email',
      'email_receipt': 'Email payment receipt to the client',
      'auto_billing': 'Auto billing',
      'button': 'Button',
      'preview': 'Preview',
      'customize': 'Customize',
      'history': 'History',
      'payment': 'Payment',
      'payments': 'Payments',
      'refunded': 'Refunded',
      'payment_type': 'Payment Type',
      'transaction_reference': 'Transaction Reference',
      'enter_payment': 'Enter Payment',
      'new_payment': 'Enter Payment',
      'created_payment': 'Successfully created payment',
      'updated_payment': 'Successfully updated payment',
      'archived_payment': 'Successfully archived payment',
      'deleted_payment': 'Successfully deleted payment',
      'restored_payment': 'Successfully restored payment',
      'archived_payments': 'Successfully archived :value payments',
      'deleted_payments': 'Successfully deleted :value payments',
      'restored_payments': 'Successfully restored :value payments',
      'quote': 'Quote',
      'quotes': 'Quotes',
      'new_quote': 'New Quote',
      'created_quote': 'Successfully created quote',
      'updated_quote': 'Successfully updated quote',
      'archived_quote': 'Successfully archived quote',
      'deleted_quote': 'Successfully deleted quote',
      'restored_quote': 'Successfully restored quote',
      'archived_quotes': 'Successfully archived :value quotes',
      'deleted_quotes': 'Successfully deleted :value quotes',
      'restored_quotes': 'Successfully restored :value quotes',
      'expense': 'Expense',
      'expenses': 'Expenses',
      'vendor': 'Vendor',
      'vendors': 'Vendors',
      'task': 'Task',
      'tasks': 'Tasks',
      'project': 'Project',
      'projects': 'Projects',
      'activity_1': ':user created client :client',
      'activity_2': ':user archived client :client',
      'activity_3': ':user deleted client :client',
      'activity_4': ':user created invoice :invoice',
      'activity_5': ':user updated invoice :invoice',
      'activity_6': ':user emailed invoice :invoice to :contact',
      'activity_7': ':contact viewed invoice :invoice',
      'activity_8': ':user archived invoice :invoice',
      'activity_9': ':user deleted invoice :invoice',
      'activity_10': ':contact entered payment :payment for invoice :invoice',
      'activity_11': ':user updated payment :payment',
      'activity_12': ':user archived payment :payment',
      'activity_13': ':user deleted payment :payment',
      'activity_14': ':user entered :credit credit',
      'activity_15': ':user updated :credit credit',
      'activity_16': ':user archived :credit credit',
      'activity_17': ':user deleted :credit credit',
      'activity_18': ':user created quote :quote',
      'activity_19': ':user updated quote :quote',
      'activity_20': ':user emailed quote :quote to :contact',
      'activity_21': ':contact viewed quote :quote',
      'activity_22': ':user archived quote :quote',
      'activity_23': ':user deleted quote :quote',
      'activity_24': ':user restored quote :quote',
      'activity_25': ':user restored invoice :invoice',
      'activity_26': ':user restored client :client',
      'activity_27': ':user restored payment :payment',
      'activity_28': ':user restored :credit credit',
      'activity_29': ':contact approved quote :quote',
      'activity_30': ':user created vendor :vendor',
      'activity_31': ':user archived vendor :vendor',
      'activity_32': ':user deleted vendor :vendor',
      'activity_33': ':user restored vendor :vendor',
      'activity_34': ':user created expense :expense',
      'activity_35': ':user archived expense :expense',
      'activity_36': ':user deleted expense :expense',
      'activity_37': ':user restored expense :expense',
      'activity_39': ':user cancelled payment :payment',
      'activity_40': ':user refunded payment :payment',
      'activity_41': 'Payment :payment failed',
      'activity_42': ':user created task :task',
      'activity_43': ':user updated task :task',
      'activity_44': ':user archived task :task',
      'activity_45': ':user deleted task :task',
      'activity_46': ':user restored task :task',
      'activity_47': ':user updated expense :expense',
      'activity_48': ':user created user',
      'activity_49': ':user updated user',
      'activity_50': ':user archived user',
      'activity_51': ':user deleted user',
      'activity_52': ':user restored user',
      'activity_53': ':user marked invoice :invoice as sent',
      'activity_54': ':user applied payment :payment to invoice :invoice',
      'activity_55': '',
      'activity_56': '',
      'activity_57': 'System failed to email invoice :invoice',
      'activity_58': ':user reversed invoice :invoice',
      'activity_59': ':user cancelled invoice :invoice',
      'activity_60': ':contact viewed quote :quote',
      'activity_61': ':user updated client :client',
      'activity_62': ':user updated vendor :vendor',
      'activity_63':
          ':user emailed first reminder for invoice :invoice to :contact',
      'activity_64':
          ':user emailed second reminder for invoice :invoice to :contact',
      'activity_65':
          ':user emailed third reminder for invoice :invoice to :contact',
      'activity_66':
          ':user emailed endless reminder for invoice :invoice to :contact',
      'activity_80': ':user created subscription',
      'activity_81': ':user updated subscription',
      'activity_82': ':user archived subscription',
      'activity_83': ':user deleted subscription',
      'activity_84': ':user restored subscription',
      'one_time_password': 'One Time Password',
      'emailed_quote': 'Successfully queued quote to be sent',
      'emailed_credit': 'Successfully queued credit to be sent',
      'marked_quote_as_sent': 'Successfully marked quote as sent',
      'marked_credit_as_sent': 'Successfully marked credit as sent',
      'expired': 'Expired',
      'all': 'All',
      'select': 'Select',
      'long_press_multiselect': 'Long-press Multiselect',
      'custom_value1': 'Custom Value 1',
      'custom_value2': 'Custom Value 2',
      'custom_value3': 'Custom Value 3',
      'custom_value4': 'Custom Value 4',
      'email_style_custom': 'Custom Email Style',
      'custom_message_dashboard': 'Custom Dashboard Message',
      'custom_message_unpaid_invoice': 'Custom Unpaid Invoice Message',
      'custom_message_paid_invoice': 'Custom Paid Invoice Message',
      'custom_message_unapproved_quote': 'Custom Unapproved Quote Message',
      'lock_invoices': 'Lock Invoices',
      'translations': 'Translations',
      'task_number_pattern': 'Task Number Pattern',
      'task_number_counter': 'Task Number Counter',
      'expense_number_pattern': 'Expense Number Pattern',
      'expense_number_counter': 'Expense Number Counter',
      'vendor_number_pattern': 'Vendor Number Pattern',
      'vendor_number_counter': 'Vendor Number Counter',
      'ticket_number_pattern': 'Ticket Number Pattern',
      'ticket_number_counter': 'Ticket Number Counter',
      'payment_number_pattern': 'Payment Number Pattern',
      'payment_number_counter': 'Payment Number Counter',
      'invoice_number_pattern': 'Invoice Number Pattern',
      'invoice_number_counter': 'Invoice Number Counter',
      'quote_number_pattern': 'Quote Number Pattern',
      'quote_number_counter': 'Quote Number Counter',
      'client_number_pattern': 'Credit Number Pattern',
      'client_number_counter': 'Credit Number Counter',
      'credit_number_pattern': 'Credit Number Pattern',
      'credit_number_counter': 'Credit Number Counter',
      'reset_counter_date': 'Reset Counter Date',
      'counter_padding': 'Counter Padding',
      'shared_invoice_quote_counter': 'Shared Invoice/Quote Counter',
      'default_tax_name_1': 'Default Tax Name 1',
      'default_tax_rate_1': 'Default Tax Rate 1',
      'default_tax_name_2': 'Default Tax Name 2',
      'default_tax_rate_2': 'Default Tax Rate 2',
      'default_tax_name_3': 'Default Tax Name 3',
      'default_tax_rate_3': 'Default Tax Rate 3',
      'email_subject_invoice': 'Email Invoice Subject',
      'email_subject_quote': 'Email Quote Subject',
      'email_subject_payment': 'Email Payment Subject',
      'email_subject_payment_partial': 'Email Partial Payment Subject',
      'show_table': 'Show Table',
      'show_list': 'Show List',
      'client_city': 'Client City',
      'client_state': 'Client State',
      'client_country': 'Client Country',
      'client_is_active': 'Client is Active',
      'client_balance': 'Client Balance',
      'client_address1': 'Client Street',
      'client_address2': 'Client Apt/Suite',
      'vendor_address1': 'Vendor Street',
      'vendor_address2': 'Vendor Apt/Suite',
      'client_shipping_address1': 'Client Shipping Street',
      'client_shipping_address2': 'Client Shipping Apt/Suite',
      'type': 'Type',
      'invoice_amount': 'Invoice Amount',
      'invoice_due_date': 'Invoice Due Date',
      'tax_rate1': 'Tax Rate 1',
      'tax_rate2': 'Tax Rate 2',
      'tax_rate3': 'Tax Rate 3',
      'auto_bill': 'Auto Bill',
      'archived_at': 'Archived At',
      'has_expenses': 'Has Expenses',
      'custom_taxes1': 'Custom Taxes 1',
      'custom_taxes2': 'Custom Taxes 2',
      'custom_taxes3': 'Custom Taxes 3',
      'custom_taxes4': 'Custom Taxes 4',
      'custom_surcharge1': 'Custom Surcharge 1',
      'custom_surcharge2': 'Custom Surcharge 2',
      'custom_surcharge3': 'Custom Surcharge 3',
      'custom_surcharge4': 'Custom Surcharge 4',
      'is_deleted': 'Is Deleted',
      'vendor_city': 'Vendor City',
      'vendor_state': 'Vendor State',
      'vendor_country': 'Vendor Country',
      'is_approved': 'Is Approved',
      'tax_name': 'Tax Name',
      'tax_amount': 'Tax Amount',
      'tax_paid': 'Tax Paid Amount',
      'payment_amount': 'Payment Amount',
      'age': 'Age',
      'is_running': 'Is Running',
      'time_log': 'Time Log',
      'bank_id': 'Bank Id',
      'expense_category_id': 'Expense Category ID',
      'expense_category': 'Category',
      'invoice_currency_id': 'Invoice Currency ID',
      'tax_name1': 'Tax Name 1',
      'tax_name2': 'Tax Name 2',
      'tax_name3': 'Tax Name 3',
      'transaction_id': 'Transaction ID',
      'status_color_theme': 'Status Color Theme',
      'load_color_theme': 'Load Color Theme',
    },
    'fr': {
      'net_cost': 'Net Cost',
      'skip_automatic_emails': 'Skip Automatic Emails',
      'forward_email': 'Forward Email',
      'cc_only': 'Carte de crédit uniquement',
      'activity_149':
          ':user a envoyé par e-mail le crédit :credit pour :client à :contact',
      'activity_150': 'Compte supprimé :notes',
      'activity_154':
          'Facture électronique :invoice pour :client envoyée avec succès à AEAT',
      'activity_155':
          'La facture électronique :invoice relative à :client n&#39;a pas pu être envoyée à AEAT :notes',
      'activity_156':
          'Annulation de la facture :invoice envoyée avec succès à AEAT',
      'activity_157':
          'L&#39;annulation de la facture :invoice n&#39;a pas pu être envoyée à AEAT :notes',
      'activity_158': 'La requête :quote a été rejetée par :client :notes',
      'rejected': 'Rejeté',
      'quote_rejected': 'Devis refusé',
      'disable_recurring_payment_notification':
          'Désactiver la notification de paiement récurrent',
      'disable_recurring_payment_notification_help':
          'Les notifications de paiement de facture récurrente réussies ne seront pas envoyées.',
      'e_invoice_received_notification':
          'Notification de réception de la facture électronique',
      'e_invoice_received_notification_help':
          'Envoyer un courriel lorsqu&#39;une facture électronique a été reçue',
      'empty': 'Vide',
      'location_name': 'Nom du lieu',
      'location_field': 'Champ de localisation',
      'activity_151': 'Le client :notes a été fusionné avec :client par :user',
      'activity_152':
          'Le fournisseur :notes a été fusionné avec :vendor par :user',
      'activity_153': 'Le client :notes a été purgé par :user',
      'secret_key': 'Clé secrète',
      'access_key': 'Clé d&#39;accès',
      'from_address': 'Adresse expéditeur',
      'topic_arn': 'Sujet ARN',
      'replaced': 'Remplacé',
      'tax_names': 'Noms fiscaux',
      'location': 'Localisation',
      'is_shipping': 'Est-ce que l&#39;expédition',
      'deleted_location': 'Emplacement supprimé',
      'added_location': 'Emplacement ajouté avec succès',
      'updated_location': 'Emplacement mis à jour',
      'edit_location': 'Modifier l&#39;emplacement',
      'add_location': 'Ajouter un emplacement',
      'locations': 'Emplacements',
      'preference_product_notes_for_html_view':
          'Utiliser les notes d\'élément pour la vue HTML',
      'preference_product_notes_for_html_view_help':
          'Privilégiez la description de l\'article plutôt que le titre de l\'article si vous affichez la facture au format HTML.',
      'in_stock_quantity': 'Quantité en stock',
      'send_emails': 'Envoyer des e-mails',
      'send_emails_permission':
          'Autoriser l&#39;utilisateur à envoyer des e-mails',
      'enable_client_profile_update':
          'Permettre aux clients de mettre à jour leur profil',
      'enable_client_profile_update_help':
          'Permettre aux clients de mettre à jour les informations de leur profil à partir du portail client',
      'participant': 'Participant',
      'merged_vendors': 'Fournisseurs fusionnés avec succès',
      'activity_146':
          'Facture électronique :invoice pour :client livrée avec succès ! :notes',
      'activity_147':
          'Facture électronique :invoice pour livraison échouée :client . :notes',
      'activity_148': 'Dépense électronique :expense reçue de :vendor',
      'payment_failed': 'Paiement échoué',
      'activity_141': 'L&#39;utilisateur :user a saisi la note : :notes',
      'activity_142': 'Citation :quote rappel 1 envoyé',
      'activity_143':
          'Facturation automatique réussie pour la facture :invoice',
      'activity_144':
          'Échec de la facturation automatique pour la facture :invoice . :notes',
      'activity_145':
          'La facture électronique :invoice pour :client a été envoyée. :notes',
      'ssl_host_override': 'Remplacement de l&#39;hôte SSL',
      'upload_logo_short': 'Télécharger le logo',
      'show_pdfhtml_on_mobile_help':
          'Pour une visualisation améliorée, affiche une version HTML de la facture/devis lors de la visualisation sur mobile.',
      'accept_purchase_order': 'Accepter le bon de commande',
      'one_page_checkout': 'Paiement en une seule page',
      'one_page_checkout_help':
          'Activer le nouveau flux de paiement sur une seule page',
      'applies_to': 'S&#39;applique à',
      'purchase_order_items': 'Articles de bon de commande',
      'assigned_group': 'Groupe attribué avec succès',
      'assign_group': 'Attribuer un groupe',
      'merge_to_pdf': 'Fusionner en PDF',
      'emails': 'Courriels',
      'latest_requires_php_version':
          'Remarque : la dernière version nécessite PHP :version',
      'quote_reminder1': 'Rappel de la première citation',
      'before_valid_until': 'Avant le valable jusqu&#39;au',
      'after_valid_until': 'Après la validité jusqu&#39;au',
      'after_quote_date': 'Après la date du devis',
      'remind_quote': 'Rappeler la citation',
      'task_assigned_notification': 'Notification de tâche assignée',
      'task_assigned_notification_help':
          'Envoyer un e-mail lorsqu&#39;une tâche est attribuée',
      'invoices_locked_end_of_month':
          'Les factures sont bloquées à la fin du mois',
      'end_of_month': 'Fin du mois',
      'referral_url': 'URL de référence',
      'referral_program': 'Programme de parrainage',
      'comment': 'Commentaire',
      'add_comment': 'Ajouter un commentaire',
      'added_comment': 'Commentaire enregistré avec succès',
      'disconnected': 'Déconnecté',
      'reconnect': 'Reconnect',
      'e_invoice_settings': 'Paramètres de la facture électronique',
      'calculate': 'Calculer',
      'sum': 'Somme',
      'money': 'Argent',
      'time': 'Temps',
      'format': 'Format',
      'web_app': 'Application Web',
      'desktop_app': 'Application de bureau',
      'invoice_net_amount': 'Montant net de la facture',
      'round_to_seconds': 'Arrondir à la seconde près',
      '1_minute': '1 minute',
      '5_minutes': '5 minutes',
      '15_minutes': '15 minutes',
      '30_minutes': '30 minutes',
      '1_hour': '1 heure',
      '1_day': '1 jour',
      'round_tasks': 'Direction d&#39;arrondi des tâches',
      'round_tasks_help':
          'Arrondir les temps des tâches vers le haut ou vers le bas.',
      'direction': 'Direction',
      'round_up': 'Rassembler',
      'round_down': 'Arrondir vers le bas',
      'task_round_to_nearest': 'Arrondir au plus proche',
      'activity_139': 'Dépense :expense notification envoyée à :contact',
      'activity_140': 'Déclaration envoyée à :client',
      'bulk_updated': 'Données mises à jour avec succès',
      'bulk_update': 'Mise à jour en masse',
      'advanced_cards': 'Cartes avancées',
      'always_show_required_fields':
          'Toujours afficher les champs obligatoires du formulaire',
      'always_show_required_fields_help':
          'Affiche toujours les champs obligatoires du formulaire lors du paiement',
      'flutter_web_warning':
          'Nous vous recommandons d&#39;utiliser la nouvelle application Web ou l&#39;application de bureau pour obtenir les meilleures performances.',
      'rappen_rounding': 'Arrondi de Rappen',
      'rappen_rounding_help': 'Montant rond à 5 centimes',
      'check_credentials': 'Vérifier les informations d&#39;identification',
      'valid_credentials': 'Les informations d&#39;identification sont valides',
      'invalid_credentials': 'Ces informations de connexion sont invalides',
      'e_quote': 'Devis électronique',
      'e_credit': 'E-Crédit',
      'e_purchase_order': 'Bon de commande électronique',
      'valid_vat_number': 'Numéro de TVA valide',
      'use_available_payments': 'Utiliser les paiements disponibles',
      'test_email_sent': 'E-mail envoyé avec succès',
      'send_test_email': 'Envoyer un courriel de test',
      'gateway_type': 'Type de passerelle',
      'please_select_an_invoice_or_credit':
          'Veuillez sélectionner une facture ou un crédit',
      'mobile_version': 'Version mobile',
      'venmo': 'Venmo',
      'mercado_pago': 'Mercado Pago',
      'my_bank': 'Ma banque',
      'pay_later': 'Payer plus tard',
      'email_report': 'Rapport par courrier électronique',
      'host': 'Domaine',
      'port': 'Port',
      'encryption': 'Chiffrement',
      'local_domain': 'Domaine local',
      'verify_peer': 'Vérifier le pair',
      'username': 'Nom d\'utilisateur',
      'nordigen_help':
          'Remarque : la connexion d&#39;un compte nécessite une clé API GoCardless/Nordigen',
      'participant_name': 'Nom du participant',
      'yodlee_regions': 'Régions : États-Unis, Royaume-Uni, Australie et Inde',
      'nordigen_regions': 'Régions : Europe et Royaume-Uni',
      'select_provider': 'Sélectionnez le fournisseur',
      'payment_type_credit': 'Type de paiement Crédit',
      'payment_type_debit': 'Type de paiement Débit',
      'send_emails_to': 'Envoyer des e-mails à',
      'primary_contact': 'Premier contact',
      'all_contacts': 'Tous les contacts',
      'insert_below': 'Insérer ci-dessous',
      'ar_detailed': 'Comptes clients détaillés',
      'ar_summary': 'Sommaire des comptes clients',
      'client_sales': 'Ventes clients',
      'tax_summary': 'Récapitulatif de taxe',
      'user_sales': 'Ventes aux utilisateurs',
      'run_template': 'Modèle d&#39;exécution',
      'task_extension_banner':
          'Ajoutez l&#39;extension Chrome pour gérer vos tâches',
      'watch_video': 'Regarder la vidéo',
      'view_extension': 'Voir l&#39;extension',
      'reactivate_email': 'Réactiver l&#39;e-mail',
      'email_reactivated': 'E-mail réactivé avec succès',
      'template_help': 'Activer l&#39;utilisation du design comme modèle',
      'delivery_note_design': 'Conception du bon de livraison',
      'statement_design': 'Conception de la déclaration',
      'payment_receipt_design': 'Conception du reçu de paiement',
      'payment_refund_design': 'Conception de remboursement de paiement',
      'quarter': 'Quart',
      'item_description': 'Description de l&#39;article',
      'task_item': 'Élément de tâche',
      'record_state': 'État d&#39;enregistrement',
      'last_login': 'Dernière connexion',
      'save_files_to_this_folder': 'Enregistrez les fichiers dans ce dossier',
      'downloads_folder': 'Dossier de téléchargements',
      'total_invoiced_quotes': 'Devis facturés',
      'total_invoice_paid_quotes': 'Devis sur facture payée',
      'downloads_folder_does_not_exist':
          'Le dossier de téléchargement n&#39;existe pas :value',
      'user_logged_in_notification': 'Notification d&#39;utilisateur connecté',
      'user_logged_in_notification_help':
          'Envoyer un e-mail lors de la connexion à partir d&#39;un nouvel emplacement',
      'client_contact': 'Contact client',
      'expense_status_4': 'Non payé',
      'expense_status_5': 'Payé',
      'recurring': 'Récurrent',
      'ziptax_help':
          'Remarque : cette fonctionnalité nécessite une clé API Zip-Tax pour rechercher la taxe de vente américaine par adresse.',
      'cache_data': 'Données en cache',
      'unknown': 'Inconnu',
      'webhook_failure': 'Échec du webhook',
      'email_opened': 'E-mail ouvert',
      'email_delivered': 'E-mail livré',
      'log': 'Enregistrer',
      'individual': 'Individuel',
      'partnership': 'Partenariat',
      'trust': 'Confiance',
      'charity': 'Charité',
      'government': 'Gouvernement',
      'classification': 'Classification',
      'click_or_drop_files_here': 'Cliquez ou déposez les fichiers ici',
      'public': 'Publique',
      'private': 'Privé',
      'image': 'Image',
      'other': 'Autre',
      'hash': 'Hacher',
      'linked_to': 'Lié à',
      'file_saved_in_path': 'Le fichier a été enregistré dans :path',
      'unlinked_transactions': 'Transactions :count dissociées avec succès',
      'unlinked_transaction': 'Transaction dissociée avec succès',
      'unlink': 'Dissocier',
      'view_dashboard_permission':
          'Autoriser l&#39;utilisateur à accéder au tableau de bord, les données sont limitées aux autorisations disponibles',
      'is_tax_exempt': 'Exonéré d&#39;impôt',
      'district': 'District',
      'region': 'Région',
      'county': 'Comté',
      'tax_details': 'Détails fiscaux',
      'activity_10_online':
          ':contact a effectué le paiement :payment pour la facture :invoice pour :client',
      'activity_10_manual':
          ':user a saisi le paiement :payment pour la facture :invoice pour :client',
      'default_payment_type': 'Type de paiement par défaut',
      'admin_initiated_payments': 'Paiements initiés par l&#39;administrateur',
      'admin_initiated_payments_help':
          'Prise en charge de la saisie d&#39;un paiement dans le portail d&#39;administration sans facture',
      'use_mobile_to_manage_plan':
          'Utilisez les paramètres de votre abonnement téléphonique pour gérer votre forfait',
      'show_task_billable': 'Afficher la tâche facturable',
      'credit_item': 'Article de crédit',
      'files': 'Des dossiers',
      'camera': 'Caméra',
      'gallery': 'Galerie',
      'email_count_invoices': 'Envoi de :count factures',
      'project_location': 'Emplacement du projet',
      'invoice_task_item_description':
          'Description de l&#39;élément de tâche de la facture',
      'invoice_task_item_description_help':
          'Ajouter la description de l&#39;article aux éléments de ligne de la facture',
      'next_send_time': 'Prochaine heure d\'envoi',
      'uploaded_certificate': 'Le certificat a été téléversé',
      'certificate_set': 'Le certificat est défini',
      'certificate_not_set': 'Le certificat n\'est pas défini',
      'passphrase_set': 'La phrase de passe est définie',
      'passphrase_not_set': 'La phrase de passe n\'est pas définie',
      'upload_certificate': 'Téléverser le certificat',
      'certificate_passphrase': 'Phrase de passe du certificat',
      'rename': 'Renommer',
      'renamed_document': 'Document renommé avec succès',
      'e_invoice': 'Facture électronique',
      'light_dark_mode': 'Thème clair/sombre',
      'activities': 'Activités',
      'routing_id': 'ID de routage',
      'enable_e_invoice': 'Activer la facturation électronique',
      'e_invoice_type': 'Type de facture électronique',
      'e_quote_type': 'Type de devis électronique',
      'reduced_tax': 'Taxe réduite',
      'override_tax': 'Outrepasser la taxe',
      'zero_rated': 'Évaluation à zéro',
      'reverse_tax': 'Taxe inversée',
      'updated_tax_category': 'La catégorie de taxe a été mise à jour',
      'updated_tax_categories': 'Les catégories de taxes ont été mises à jour',
      'set_tax_category': 'Définir la catégorie de taxe',
      'payment_manual': 'Paiement manuel',
      'tax_category': 'Catégorie de taxe',
      'physical_goods': 'Produits physiques',
      'digital_products': 'Produits numériques',
      'services': 'Services',
      'shipping': 'Livraison',
      'tax_exempt': 'Dispensé de taxe',
      'reduced_rate': 'Tarif réduit',
      'tax_all': 'Taxe Tout',
      'tax_selected': 'Taxe sélectionnée',
      'version': 'version',
      'seller_subregion': 'Sous-région du vendeur',
      'calculate_taxes': 'Calculer les taxes',
      'calculate_taxes_help':
          'Calculer automatiquement les taxes lors de l\'enregistrement des factures',
      'admin': 'Admin',
      'owner': 'Propriétaire',
      'link_expenses': 'Dépenses de lien',
      'converted_client_balance': 'Solde client converti',
      'converted_payment_balance': 'Solde de paiement converti',
      'total_hours': 'Heures totales',
      'date_picker_hint': 'Utilisez + jours pour définir la date dans le futur',
      'browser_pdf_viewer': 'Utiliser le lecteur PDF du navigateur',
      'browser_pdf_viewer_help':
          'Attention: Ne permet pas d\'interagir avec l\'application sur le PDF',
      'increase_prices': 'Augmenter les prix',
      'update_prices': 'Mettre à jour les prix',
      'incresed_prices':
          'Les prix ont été mis en file d\'attente avec succès pour être augmentés',
      'updated_prices':
          'Les prix ont bien été mis en file d\'attente pour être mis à jour',
      'bacs': 'Prélèvement automatique BACS',
      'api_token': 'Jeton d\'API',
      'api_key': 'clé API',
      'endpoint': 'Point final',
      'billable': 'Facturable',
      'not_billable': 'Non facturable',
      'allow_billable_task_items':
          'Autoriser les éléments de tâche facturables',
      'allow_billable_task_items_help':
          'Activer la configuration des éléments de tâche facturés',
      'show_task_item_description':
          'Afficher la description de l\'élément de tâche',
      'show_task_item_description_help':
          'Activer la spécification des descriptions des éléments de tâche',
      'email_record': 'Enregistrement par e-mail',
      'invoice_product_columns': 'Colonnes de produit de facture',
      'quote_product_columns': 'Colonnes de produits de devis',
      'minimum_payment_amount': 'Montant du paiement minimal',
      'client_initiated_payments': 'Paiements initiés par le client',
      'client_initiated_payments_help':
          'Assistance pour effectuer un paiement dans le portail client sans facture',
      'share_invoice_quote_columns': 'Partager les colonnes de facture/devis',
      'cc_email': 'E-mail CC',
      'payment_balance': 'Solde de paiement',
      'view_report_permission':
          'Autoriser l\'utilisateur à accéder aux rapports, les données sont limitées aux autorisations disponibles',
      'activity_138': 'Paiement :payment a été envoyé par e-mail à :client',
      'one_time_products': 'Produits uniques',
      'optional_one_time_products': 'Produits uniques en option',
      'required': 'Requis',
      'hidden': 'Caché',
      'payment_links': 'Liens de paiement',
      'action': 'Action',
      'upgrade_to_paid_plan_to_schedule':
          'Passez à un forfait payant pour créer des planifications',
      'next_run': 'Prochaine exécution',
      'all_clients': 'Tous les clients',
      'show_aging_table': 'Afficher la table d\'âge',
      'show_payments_table': 'Afficher le tableau des paiements',
      'only_clients_with_invoices': 'Seuls les clients avec factures',
      'email_statement': 'Relevé par e-mail',
      'once': 'Une fois',
      'schedule': 'Planification',
      'schedules': 'Planifications',
      'new_schedule': 'Nouveau programme',
      'edit_schedule': 'Modifier l\'horaire',
      'created_schedule': 'Horaire créé avec succès',
      'updated_schedule': 'Calendrier mis à jour avec succès',
      'archived_schedule': 'Horaire archivé avec succès',
      'deleted_schedule': 'Programme supprimé avec succès',
      'removed_schedule': 'Calendrier supprimé avec succès',
      'restored_schedule': 'Calendrier restauré avec succès',
      'search_schedule': 'Calendrier de recherche',
      'search_schedules': 'Rechercher des planifications',
      'archive_payment': 'Archiver ce paiement',
      'archive_invoice': 'Archiver la facture',
      'archive_quote': 'Archiver ce devis',
      'archive_credit': 'Archiver ce crédit',
      'archive_task': 'Archiver la tâche',
      'archive_client': 'Archiver ce client',
      'archive_project': 'Archiver le projet',
      'archive_expense': 'Archiver la dépense',
      'restore_payment': 'Restaurer le paiement',
      'restore_invoice': 'Restaurer la facture',
      'restore_quote': 'Restaurer le devis',
      'restore_credit': 'Restaurer le crédit',
      'restore_task': 'Restaurer la tâche',
      'restore_client': 'Restaurer le client',
      'restore_project': 'Restaurer le projet',
      'restore_expense': 'Restaurer la dépense',
      'archive_vendor': 'Archiver ce fournisseur',
      'restore_vendor': 'Restaurer le fournisseur',
      'create_product': 'Nouveau produit',
      'update_product': 'Mettre à jour le produit',
      'delete_product': 'Effacer le Produit',
      'restore_product': 'Rétablir le produit',
      'archive_product': 'Archiver ce produit',
      'create_purchase_order': 'Créer un bon de commande',
      'update_purchase_order': 'Mettre à jour le bon de commande',
      'delete_purchase_order': 'Supprimer le bon de commande',
      'restore_purchase_order': 'Restaurer le bon de commande',
      'archive_purchase_order': 'Archiver le bon de commande',
      'sent_invoice': 'Facture envoyée',
      'sent_quote': 'Devis envoyé',
      'sent_credit': 'Crédit envoyé',
      'sent_purchase_order': 'Bon de commande envoyé',
      'image_url': 'URL de l\'image',
      'max_quantity': 'Quantité maximale',
      'test_url': 'Tester l\'URL',
      'auto_bill_help_off': 'L\'option n\'est pas affichée',
      'auto_bill_help_optin': 'L\'option est affichée mais pas sélectionnée',
      'auto_bill_help_optout': 'L\'option est affichée et sélectionnée',
      'auto_bill_help_always': 'L\'option n\'est pas affichée',
      'payment_methods': 'Moyen de paiement',
      'view_all': 'Voir tout',
      'edit_all': 'Tout modifier',
      'accept_purchase_order_number': 'Accepter le numéro de bon de commande',
      'accept_purchase_order_number_help':
          'Permettre aux clients de fournir un numéro de bon de commande lors de l\'approbation d\'un devis',
      'from_email': 'De l\'email',
      'show_preview': 'Afficher l\'aperçu',
      'show_paid_stamp': 'Afficher le timbre payé',
      'show_shipping_address': 'Afficher l\'adresse de livraison',
      'no_documents_to_download':
          'Il n\'y a pas de documents dans les enregistrements sélectionnés à télécharger',
      'pixels': 'pixels',
      'logo_size': 'Taille du logo',
      'postal_city': 'Code postal/Ville',
      'failed': 'Échoué',
      'client_contacts': 'Coordonnées clients',
      'sync_from': 'Synchroniser depuis',
      'inventory_threshold': 'Seuil d\'inventaire',
      'hour': 'Heure',
      'emailed_statement':
          'Relevé mis en file d\'attente avec succès à envoyer',
      'show_email_footer': 'Afficher le pied de page de l\'e-mail',
      'invoice_task_hours': 'Heures de tâche de facturation',
      'invoice_task_hours_help': 'Ajouter les heures aux postes de la facture',
      'auto_bill_standard_invoices':
          'Facturation automatique des factures standard',
      'auto_bill_recurring_invoices':
          'Facturation automatique des factures récurrentes',
      'email_alignment': 'Alignement des e-mails',
      'pdf_preview_location': 'Emplacement de prévisualisation PDF',
      'mailgun': 'Mailgun',
      'postmark': 'Cachet de la poste',
      'microsoft': 'Microsoft',
      'click_plus_to_create_record':
          'Cliquez sur + pour créer un enregistrement',
      'last365_days': '365 derniers jours',
      'import_design': 'Importer la conception',
      'imported_design': 'Conception importée avec succès',
      'invalid_design':
          'Le design est invalide, la section :value est manquante',
      'setup_wizard_logo': 'Souhaitez-vous télécharger votre logo ?',
      'upload': 'Envoyer',
      'installed_version': 'Version installée',
      'notify_vendor_when_paid': 'Avertir le fournisseur une fois payé',
      'notify_vendor_when_paid_help':
          'Envoyer un e-mail au fournisseur lorsque la dépense est marquée comme payée',
      'update_payment': 'Mettre à jour le paiement',
      'markup': 'Balisage',
      'purchase_order_created': 'Bon de commande créé',
      'purchase_order_sent': 'Bon de commande envoyé',
      'purchase_order_viewed': 'Bon de commande consulté',
      'purchase_order_accepted': 'Bon de commande accepté',
      'credit_payment_error':
          'Le montant du crédit ne peut pas être supérieur au montant du paiement',
      'klarna': 'Klarna',
      'convert_payment_currency_help':
          'Définir un taux de change lors de la saisie d\'un paiement manuel',
      'convert_expense_currency_help':
          'Définir un taux de change lors de la création d\'une dépense',
      'matomo_url': 'URL Matomo',
      'matomo_id': 'Identifiant Matomo',
      'action_add_to_invoice': 'Ajouter à la facture',
      'online_payment_email_help':
          'Envoyer un e-mail lorsqu\'un paiement en ligne est effectué',
      'manual_payment_email_help':
          'Envoyer un e-mail lors de la saisie manuelle d\'un paiement',
      'mark_paid_payment_email_help':
          'Envoyer un e-mail lorsque vous marquez une facture comme payée',
      'delete_project': 'Effacer le Projet',
      'linked_transaction': 'Transaction liée avec succès',
      'link_payment': 'Lien Paiement',
      'link_expense': 'Dépense de lien',
      'lock_invoiced_tasks': 'Verrouiller les tâches facturées',
      'lock_invoiced_tasks_help':
          'Empêcher les tâches d\'être modifiées une fois facturées',
      'registration_required': 'Enregistrement Requis',
      'registration_required_help': 'Exiger que les clients s\'inscrivent',
      'use_inventory_management': 'Utiliser la gestion des stocks',
      'use_inventory_management_help':
          'Exiger que les produits soient en stock',
      'optional_products': 'Produits optionnels',
      'optional_recurring_products': 'Produits récurrents facultatifs',
      'convert_matched': 'Convertir',
      'auto_billed_invoice':
          'Facture mise en file d\'attente avec succès pour être facturée automatiquement',
      'auto_billed_invoices':
          'Factures mises en file d\'attente avec succès pour être facturées automatiquement',
      'operator': 'Opérateur',
      'value': 'Valeur',
      'is': 'Est',
      'contains': 'Contient',
      'starts_with': 'Commence avec',
      'is_empty': 'Est vide',
      'add_rule': 'Ajouter une règle',
      'match_all_rules': 'Respecter toutes les règles',
      'match_all_rules_help':
          'Tous les critères doivent correspondre pour que la règle soit appliquée',
      'auto_convert_help':
          'Convertissez automatiquement les transactions correspondantes en dépenses',
      'rules': 'Règles',
      'transaction_rule': 'Règle de transaction',
      'transaction_rules': 'Règles de transaction',
      'new_transaction_rule': 'Nouvelle règle de transaction',
      'edit_transaction_rule': 'Modifier la règle de transaction',
      'created_transaction_rule': 'Règle créée avec succès',
      'updated_transaction_rule':
          'Règle de transaction mise à jour avec succès',
      'archived_transaction_rule': 'Règle de transaction archivée avec succès',
      'deleted_transaction_rule': 'Règle de transaction supprimée avec succès',
      'removed_transaction_rule':
          'La règle de transaction a bien été supprimée',
      'restored_transaction_rule': 'Règle de transaction restaurée avec succès',
      'search_transaction_rule': 'Rechercher une règle de transaction',
      'search_transaction_rules': 'Rechercher des règles de transaction',
      'save_as_default_terms': 'Enregistrer comme conditions par défaut',
      'save_as_default_footer': 'Définir comme pied de facture par défaut',
      'auto_sync': 'Synchronisation automatique',
      'refresh_accounts': 'Actualiser les comptes',
      'upgrade_to_connect_bank_account':
          'Passez à Enterprise pour connecter votre compte bancaire',
      'click_here_to_connect_bank_account':
          'Cliquez ici pour connecter votre compte bancaire',
      'disable_2fa': 'Désactiver 2FA',
      'change_number': 'Changer de numéro',
      'resend_code': 'Renvoyer le code',
      'base_type': 'Type de base',
      'category_type': 'Type de catégorie',
      'bank_transaction': 'Transaction',
      'bulk_print': 'Imprimer PDF',
      'vendor_postal_code': 'Code postal du fournisseur',
      'preview_location': 'Emplacement de l\'aperçu',
      'bottom': 'En bas',
      'side': 'Sur le coté',
      'pdf_preview': 'Aperçu PDF',
      'long_press_to_select': 'Appuyez longuement pour sélectionner',
      'purchase_order_number': 'Numéro de commande',
      'purchase_order_item': 'Article du bon de commande',
      'would_you_rate_the_app': 'Souhaitez-vous évaluer l\'application ?',
      'include_deleted': 'Inclure supprimé',
      'include_deleted_help':
          'Inclure les enregistrements supprimés dans les rapports',
      'due_on': 'Dû le',
      'converted_transactions': 'Transactions converties avec succès',
      'created_bank_account': 'Compte bancaire créé avec succès',
      'updated_bank_account': 'Compte bancaire mis à jour avec succès',
      'edit_bank_account': 'Éditer le compte bancaire',
      'default_category': 'Catégorie par défaut',
      'account_type': 'Type de compte',
      'new_bank_account': 'Ajouter un compte bancaire',
      'connect_accounts': 'Connecter des comptes',
      'manage_rules': 'Gérer les règles',
      'search_category': 'Rechercher 1 catégorie',
      'search_categories': 'Recherche :number de catégories',
      'min_amount': 'Montant minimal',
      'max_amount': 'Montant maximum',
      'selected': 'Sélectionné(s)',
      'converted_transaction': 'Transaction convertie avec succès',
      'convert_to_payment': 'Convertir en paiement',
      'deposit': 'Dépôt',
      'withdrawal': 'Retrait',
      'deposits': 'Dépôts',
      'withdrawals': 'Retraits',
      'matched': 'Apparié',
      'unmatched': 'Incomparable',
      'create_credit': 'Créer un crédit',
      'update_credit': 'Mettre à jour un crédit',
      'delete_credit': 'Supprimer ce crédit',
      'transaction': 'Transaction',
      'transactions': 'Transactions',
      'new_transaction': 'Nouvelle transaction',
      'edit_transaction': 'Modifier l\'opération',
      'created_transaction': 'Transaction créée avec succès',
      'updated_transaction': 'Transaction mise à jour avec succès',
      'archived_transaction': 'Transaction archivée avec succès',
      'deleted_transaction': 'Transaction supprimée avec succès',
      'removed_transaction': 'Transaction supprimée avec succès',
      'restored_transaction': 'Transaction restaurée avec succès',
      'search_transaction': 'Rechercher une opération',
      'search_transactions': 'Rechercher :count les transactions',
      'bank_account': 'Compte Bancaire',
      'bank_accounts': 'Comptes bancaires',
      'archived_bank_account': 'Compte bancaire archivé avec succès',
      'deleted_bank_account': 'Compte bancaire supprimé avec succès',
      'removed_bank_account': 'Compte bancaire supprimé avec succès',
      'restored_bank_account': 'Compte bancaire restauré avec succès',
      'search_bank_account': 'Rechercher un compte bancaire',
      'search_bank_accounts': 'Rechercher :count les comptes bancaires',
      'connect': 'Connecter',
      'mark_paid_payment_email': 'Marquer l\'e-mail de paiement payé',
      'convert_to_project': 'Convertir en projet',
      'client_email': 'Courriel du client',
      'invoice_task_project': 'Projet de tâche de facture',
      'invoice_task_project_help':
          'Ajouter le projet aux éléments de ligne de la facture',
      'field': 'Champ',
      'period': 'Période',
      'fields_per_row': 'Champs par ligne',
      'total_active_invoices': 'Factures actives',
      'total_outstanding_invoices': 'Factures impayées',
      'total_completed_payments': 'Paiements effectués',
      'total_refunded_payments': 'Paiements remboursés',
      'total_active_quotes': 'Citations actives',
      'total_approved_quotes': 'Devis approuvés',
      'total_unapproved_quotes': 'Devis non approuvés',
      'total_logged_tasks': 'Tâches enregistrées',
      'total_invoiced_tasks': 'Tâches facturées',
      'total_paid_tasks': 'Tâches rémunérées',
      'total_logged_expenses': 'Dépenses enregistrées',
      'total_pending_expenses': 'Dépenses en attente',
      'total_invoiced_expenses': 'Frais facturés',
      'total_invoice_paid_expenses': 'Dépenses payées par facture',
      'activity_130': ':user a créé le bon de commande :purchase_order',
      'activity_131':
          ':user de commande mis à jour par l\'utilisateur :purchase_order',
      'activity_132':
          ':user a envoyé un bon de commande par e-mail :purchase_order',
      'activity_133': ':user a supprimé le bon de commande :purchase_order',
      'activity_134': ':user a restauré le bon de commande :purchase_order',
      'activity_135':
          ':user a envoyé un bon de commande par e-mail :purchase_order',
      'activity_136': ':contact a consulté le bon de commande :purchase_order',
      'activity_137': ':contact commande d\'achat acceptée :purchase_order',
      'vendor_portal': 'Portail des fournisseurs',
      'send_code': 'Envoyer le code',
      'save_to_upload_documents':
          'Enregistrez le dossier pour télécharger des documents',
      'expense_tax_rates': 'Taux d\'imposition des dépenses',
      'invoice_item_tax_rates': 'Taux de taxe des positions de facture',
      'verified_phone_number': 'Numéro de téléphone vérifié avec succès',
      'code_was_sent': 'Un code a été envoyé par SMS',
      'code_was_sent_to': 'Un code a été envoyé par SMS à :number',
      'resend': 'Renvoyer',
      'verify': 'Vérifier',
      'enter_phone_number': 'Veuillez fournir un numéro de téléphone',
      'invalid_phone_number': 'Numéro de téléphone invalide',
      'verify_phone_number': 'Vérifier le numéro de téléphone',
      'verify_phone_number_help':
          'Veuillez vérifier votre numéro de téléphone pour envoyer des e-mails',
      'verify_phone_number_2fa_help':
          'Veuillez vérifier votre numéro de téléphone pour la sauvegarde 2FA',
      'merged_clients': 'Clients fusionnés avec succès',
      'merge_into': 'Fusionner en',
      'merge': 'Fusionner',
      'price_change_accepted': 'Changement de prix accepté',
      'price_change_failed': 'Le changement de prix a échoué avec le code',
      'restore_purchases': 'Restaurer les achats',
      'activate': 'Activer',
      'connect_apple': 'Connecter Apple',
      'disconnect_apple': 'Déconnecter Apple',
      'disconnected_apple': 'Apple a été déconnecté avec succès',
      'send_now': 'Envoyer maintenant',
      'received': 'Reçu',
      'purchase_order_date': 'Date du bon de commande',
      'converted_to_expense': 'Conversion réussie en dépense',
      'converted_to_expenses': 'Conversion réussie en dépenses',
      'convert_to_expense': 'Convertir en dépense',
      'add_to_inventory': 'Ajouter à l\'inventaire',
      'added_purchase_order_to_inventory':
          'Bon de commande ajouté avec succès à l\'inventaire',
      'added_purchase_orders_to_inventory':
          'Bons de commande ajoutés avec succès à l\'inventaire',
      'client_document_upload': 'Envoi de documents par les clients',
      'vendor_document_upload': 'Envoi de documents par les fournisseurs',
      'vendor_document_upload_help':
          'Activer l\'envoi de documents par les fournisseurs',
      'are_you_enjoying_the_app': 'Appréciez-vous l\'application ?',
      'yes_its_great': 'Oui, c\'est parfait !',
      'not_so_much': 'Pas tellement',
      'would_you_rate_it': 'Ravi de l\'entendre! Souhaitez-vous l\'évaluer ?',
      'would_you_tell_us_more':
          'Désolé de l\'entendre! Souhaitez-vous nous en dire plus ?',
      'sure_happy_to': 'Bien sûr, heureux de',
      'no_not_now': 'Non pas maintenant',
      'add': 'Ajouter',
      'last_sent_template': 'Dernier modèle envoyé',
      'enable_flexible_search': 'Active la recherche flexible',
      'enable_flexible_search_help':
          'Correspondance de caractères non contigus, par exemple, \'ct\' va trouver \'cat\'',
      'vendor_details': 'Détails du fournisseur',
      'purchase_order_details': 'Détails du bon de commande',
      'qr_iban': 'QRIBAN',
      'besr_id': 'ID BVRB',
      'accept': 'Accepter',
      'clone_to_purchase_order': 'Cloner vers PO',
      'vendor_email_not_set':
          'Le fournisseur n\'a pas défini d\'adresse e-mail',
      'bulk_send_email': 'Envoyer un e-mail',
      'marked_purchase_order_as_sent':
          'Bon de commande marqué avec succès comme envoyé',
      'marked_purchase_orders_as_sent':
          'Bons de commande marqués avec succès comme envoyés',
      'accepted_purchase_order': 'Bon de commande accepté avec succès',
      'accepted_purchase_orders': 'Bons de commande acceptés avec succès',
      'cancelled_purchase_order': 'Bon de commande annulé avec succès',
      'cancelled_purchase_orders': 'Bons de commande annulés avec succès',
      'accepted': 'Accepté',
      'please_select_a_vendor': 'Veuillez sélectionner un fournisseur',
      'purchase_order_total': 'Total du bon de commande',
      'email_purchase_order': 'Bon de commande par e-mail',
      'bulk_email_purchase_orders': 'Bons de commande par e-mail',
      'disconnected_email': 'E-mail déconnecté avec succès',
      'connect_email': 'Se connecter',
      'disconnect_email': 'Déconnecter l\'e-mail',
      'use_web_app_to_connect_microsoft':
          'Veuillez utiliser l\'application Web pour vous connecter à Microsoft',
      'email_provider': 'Fournisseur de messagerie',
      'connect_microsoft': 'Connecter Microsoft',
      'disconnect_microsoft': 'Déconnecter Microsoft',
      'connected_microsoft': 'Microsoft connecté avec succès',
      'disconnected_microsoft': 'Microsoft déconnecté avec succès',
      'microsoft_sign_in': 'Connectez-vous avec Microsoft',
      'microsoft_sign_up': 'S\'inscrire auprès de Microsoft',
      'emailed_purchase_order':
          'Bon de commande mis en file d\'attente avec succès à envoyer',
      'emailed_purchase_orders':
          'Commandes d\'achat mises en file d\'attente avec succès à envoyer',
      'enable_react_app': 'Passer à l\'application Web React',
      'purchase_order_design': 'Modèle de bon de commande',
      'purchase_order_terms': 'Conditions du bon de commande',
      'purchase_order_footer': 'Pied de page du bon de commande',
      'require_purchase_order_signature': 'Signature du bon de commande',
      'require_purchase_order_signature_help':
          'Exiger que le vendeur fournisse sa signature',
      'purchase_order': 'Bon de commande',
      'purchase_orders': 'Bons de commande',
      'new_purchase_order': 'Nouveau bon de commande',
      'edit_purchase_order': 'Modifier le bon de commande',
      'created_purchase_order': 'Bon de commande créé avec succès',
      'updated_purchase_order': 'Bon de commande mis à jour avec succès',
      'archived_purchase_order': 'Bon de commande archivé avec succès',
      'deleted_purchase_order': 'Bon de commande supprimé avec succès',
      'removed_purchase_order': 'Bon de commande supprimé avec succès',
      'restored_purchase_order': 'Bon de commande restauré avec succès',
      'search_purchase_order': 'Rechercher un bon de commande',
      'search_purchase_orders': 'Rechercher des bons de commande',
      'login_url': 'URL de connexion',
      'payment_settings': 'Paramètres de paiement',
      'default': 'Par défaut',
      'stock_quantity': 'Quantité en stock',
      'notification_threshold': 'Seuil de notification',
      'track_inventory': 'Gérer l\'inventaire',
      'track_inventory_help':
          'Afficher un champ quantité en stock et le mettre à jour à l\'envoi de factures',
      'stock_notifications': 'Notifications de stock',
      'stock_notifications_help':
          'Envoyer un email quand le stock atteint une valeur limite',
      'vat': 'T.V.A.',
      'standing': 'En attente',
      'view_map': 'Voir la carte',
      'set_default_design': 'Définir le modèle par défaut',
      'add_gateway': 'Ajouter une passerelle de paiement',
      'add_gateway_help_message':
          'Ajoutez une passerelle de paiement (c.-à-d. Stripe, WePay ou PayPal) pour accepter les paiements en ligne',
      'left': 'Gauche',
      'right': 'Droite',
      'center': 'Centre',
      'page_numbering': 'Numéros de page',
      'page_numbering_alignment': 'Alignement des numéros de page',
      'invoice_sent_notification_label': 'facture envoyée',
      'show_product_description': 'Afficher la description des produits',
      'show_product_description_help':
          'Inclure la description dans la liste déroulante du produit',
      'invoice_items': 'Articles de facture',
      'quote_items': 'Articles de devis',
      'profitloss': 'Profit et perte',
      'import_format': 'Format d\'importation',
      'export_format': 'Format d\'exportation',
      'export_type': 'Type d\'exportation',
      'stop_on_unpaid': 'Arrêter en cas de non-paiement',
      'stop_on_unpaid_help':
          'Arrêter la création de factures récurrentes si la dernière facture est impayée',
      'use_quote_terms': 'Utiliser les conditions des offres',
      'use_quote_terms_help': 'à la conversion d\'une offre en facture',
      'add_country': 'Ajouter un pays',
      'enable_tooltips': 'Activer les bulles d\'aide',
      'enable_tooltips_help':
          'Affiche les bulles d\'aide au passage de la souris',
      'multiple_client_error':
          'Erreur : les enregistrements appartiennent à plusieurs clients',
      'register_label': 'Créez votre compte en quelques secondes',
      'login_label': 'Connectez-vous à un compte existant',
      'add_to_invoice': 'Ajouter à la facture :invoice',
      'no_invoices_found': 'Aucune facture trouvée',
      'week': 'Semaine',
      'created_record': 'Enregistrement créé avec succès',
      'auto_archive_paid_invoices':
          'Archiver automatiquement une facture payée',
      'auto_archive_paid_invoices_help':
          'Archiver automatiquement les factures lorsqu\'elles sont payées',
      'auto_archive_cancelled_invoices':
          'Archiver automatiquement une facture annulée',
      'auto_archive_cancelled_invoices_help':
          'Archiver automatiquement les factures lorsqu\'elles sont annulées',
      'alternate_pdf_viewer': 'Visionneuse PDF alternative',
      'alternate_pdf_viewer_help':
          'Améliorer le défilement de l\'aperçu PDF [BETA]',
      'invoice_currency': 'Devise de la facture',
      'range': 'Portée',
      'tax_amount1': 'Montant de la taxe 1',
      'tax_amount2': 'Montant de la taxe 2',
      'tax_amount3': 'Montant de la taxe 3',
      'create_project': 'Créer un projet',
      'update_project': 'Mettre à jour le projet',
      'view_task': 'Afficher la tâche',
      'cancel_invoice': 'Annuler',
      'changed_status': 'L\'état de la tâche a bien été modifié',
      'change_status': 'Modifier le statut',
      'fees_sample': 'Le frais pour une facture de :amount serait de :total.',
      'enable_touch_events': 'Activer les événements \'Touch\'',
      'enable_touch_events_help':
          'Prend en charge les événements de glissement pour faire défiler',
      'after_saving': 'Après l\'enregistrement',
      'view_record': 'Voir l\'élément',
      'enable_email_markdown': 'Activer la démarque des e-mails',
      'enable_email_markdown_help':
          'Utiliser l\'éditeur visuel de démarquage pour les e-mails',
      'enable_pdf_markdown': 'Activer PDF Markdown',
      'json_help':
          'Remarque : les fichiers JSON générés par l\'application v4 ne sont pas pris en charge',
      'release_notes': 'Notes de version',
      'upgrade_to_view_reports':
          'Mettez à niveau votre plan pour afficher les rapports',
      'started_tasks': 'Démarrage réussi :value tâches',
      'stopped_tasks': 'Arrêté avec succès :value tâches',
      'approved_quote': 'Devis approuvé avec succès',
      'approved_quotes': 'Réussir :value les devis approuvés',
      'approve': 'Accepter',
      'client_website': 'Site Web client',
      'invalid_time': 'Heure invalide',
      'client_shipping_state': 'État d\'expédition du client',
      'client_shipping_city': 'Ville d\'expédition du client',
      'client_shipping_postal_code': 'Code postal d\'expédition du client',
      'client_shipping_country': 'Pays d\'expédition du client',
      'load_pdf': 'Charger le PDF',
      'start_free_trial': 'Commencer l\'essai gratuit',
      'start_free_trial_message':
          'Commencez votre essai GRATUIT de 14 jours du plan Pro',
      'due_on_receipt': 'Payable à réception',
      'is_paid': 'Est payé',
      'age_group_paid': 'Payé',
      'id': 'Identifiant',
      'convert_to': 'Convertir dans',
      'client_currency': 'Devise du client',
      'company_currency': 'Devise de l\'entreprise',
      'purged_client': 'Client purgé avec succès',
      'custom_emails_disabled_help':
          'Pour éviter le spam, nous avons besoin d\'une mise à niveau vers un compte payant pour personnaliser l\'e-mail',
      'upgrade_to_add_company':
          'Améliorez votre plan pour ajouter des entreprises',
      'small': 'Petit',
      'marked_credit_as_paid': 'Avoir marqué avec succès comme payé',
      'marked_credits_as_paid': 'Crédits marqués avec succès comme payés',
      'wait_for_loading':
          'Chargement des données - veuillez attendre qu\'il soit terminé',
      'wait_for_saving':
          'Sauvegarde des données - veuillez attendre qu\'elle soit terminée',
      'html_preview_warning':
          'Remarque : les modifications apportées ici ne sont qu\'un aperçu, elles doivent être appliquées dans les onglets ci-dessus pour être enregistrées',
      'remaining': 'Restant',
      'invoice_paid': 'facture payee',
      'activity_120':
          ': dépense récurrente créée par l\'utilisateur :recurring_expense',
      'activity_121':
          ':user a mis à jour la dépense récurrente :recurring_expense',
      'activity_122': ':user archivée récurrente :recurring_expense',
      'activity_123':
          ':user a supprimé la dépense récurrente :recurring_expense',
      'activity_124':
          ':user a restauré la dépense récurrente :recurring_expense',
      'normal': 'Normal',
      'large': 'Grand',
      'extra_large': 'Extra large',
      'show_pdf_preview': 'Afficher l\'aperçu PDF',
      'show_pdf_preview_help':
          'Afficher l\'aperçu PDF lors de la rédaction des factures',
      'print_pdf': 'Imprimer PDF',
      'remind_me': 'Rappelle moi',
      'instant_bank_pay': 'Paiement bancaire instantané',
      'click_selected': 'Clic sur l’élément sélectionné',
      'hide_preview': 'Cacher l\'aperçu',
      'edit_record': 'Editer l\'élément',
      'credit_is_more_than_invoice':
          'Le montant du crédit ne peut pas être supérieur au montant de la facture',
      'giropay': 'GiroPay',
      'direct_debit': 'Prélèvement',
      'please_set_a_password': 'Veuillez définir un mot de passe de compte',
      'set_password': 'Définir le mot de passe',
      'disconnected_gateway': 'Passerelle déconnectée avec succès',
      'disconnect': 'Déconnecter',
      'add_to_invoices': 'Ajouter aux factures',
      'acss': 'Débit du SACR',
      'becs': 'Prélèvement BECS',
      'bulk_download': 'Télécharger',
      'persist_data_help':
          'Mémoriser localement les données afin de démarrer plus rapidement. La désactivation peut améliorer les performances pour les grands comptes.',
      'persist_ui': 'Mémoriser l\'interface utilisateur',
      'persist_ui_help':
          'Mémoriser l\'état de l\'interface utilisateur afin de reprendre là où vous en étiez. La désactivation peut améliorer les performances.',
      'client_postal_code': 'Code postal du client',
      'client_vat_number': 'Numéro de TVA client',
      'has_tasks': 'A des tâches',
      'registration': 'Inscription',
      'unauthorized_stripe_warning':
          'Veuillez autoriser Stripe à accepter les paiements en ligne.',
      'view_expense': 'Voir la dépense # :expense',
      'view_statement': 'Voir le relevé',
      'sepa': 'Prélèvement SEPA',
      'ideal': 'idéal',
      'przelewy24': 'Przelewy24',
      'eps': 'PSE',
      'fpx': 'FPX',
      'update_all_records': 'Mettre à jour tous les enregistrements',
      'system': 'Système',
      'set_default_company': 'Définir la société par défaut',
      'updated_company': 'Entreprise mise à jour avec succès',
      'kbc': 'CBC',
      'bancontact': 'Bancontact',
      'why_are_you_leaving':
          'Aidez-nous à nous améliorer en nous disant pourquoi (facultatif)',
      'webhook_success': 'Succès du webhook',
      'error_cross_client_tasks':
          'Les tâches doivent toutes appartenir au même client',
      'error_cross_client_expenses':
          'Les dépenses doivent toutes appartenir au même client',
      'app': 'Application',
      'for_best_performance':
          'Pour de meilleures performances, téléchargez l\'application :app',
      'gross_line_total': 'Total brut de la ligne',
      'bulk_email_invoices': 'Factures par e-mail',
      'bulk_email_quotes': 'Devis par e-mail',
      'bulk_email_credits': 'Crédits d\'e-mail',
      'from_name': 'Nom expéditeur',
      'clone_to_expense': 'Cloner en dépense',
      'recurring_expense': 'Dépense récurrente',
      'recurring_expenses': 'Dépenses récurrentes',
      'new_recurring_expense': 'Nouvelle dépense récurrente',
      'edit_recurring_expense': 'Éditer la dépense récurrente',
      'created_recurring_expense': 'Dépense récurrente créée avec succès',
      'updated_recurring_expense': 'Dépense récurrente mise à jour avec succès',
      'archived_recurring_expense': 'Dépense récurrente archivée avec succès',
      'deleted_recurring_expense': 'La dépense récurrente a été supprimée',
      'removed_recurring_expense': 'Dépense récurrente supprimée avec succès',
      'restored_recurring_expense': 'Dépense récurrente restaurée avec succès',
      'search_recurring_expense': 'Rechercher une dépense récurrente',
      'search_recurring_expenses': 'Rechercher des dépenses récurrentes',
      'last_sent_date': 'Date du dernier envoi',
      'include_drafts': 'Inclure les brouillons',
      'include_drafts_help':
          'Inclure les brouillons d\'enregistrements dans les rapports',
      'is_invoiced': 'Est facturé',
      'change_plan': 'Gérer le forfait',
      'persist_data': 'Mémoriser les données',
      'customer_count': 'Nombre de clients',
      'verify_customers': 'Vérifier les clients',
      'google_analytics': 'Google Analytics',
      'google_analytics_tracking_id': 'ID de suivi Google Analytics',
      'decimal_comma': 'Virgule décimale',
      'use_comma_as_decimal_place':
          'Utiliser la virgule comme séparateur décimal dans les formulaires',
      'select_method': 'Sélectionnez la méthode',
      'select_platform': 'Sélectionnez la plate-forme',
      'use_web_app_to_connect_gmail':
          'Veuillez utiliser l\'application Web pour vous connecter à Gmail',
      'expense_tax_help': 'Les taux de taxe sur les articles sont désactivés',
      'enable_markdown': 'Activer Markdown',
      'enable_markdown_help': 'Convertir Markdown en HTML sur le PDF',
      'user_guide': 'Guide de l\'utilisateur',
      'add_second_contact': 'Ajouter un contact secondaire',
      'previous_page': 'Page précédente',
      'next_page': 'Page suivante',
      'export_colors': 'Exporter les couleurs',
      'import_colors': 'Importer des couleurs',
      'clear_all': 'Tout effacer',
      'contrast': 'Contraste',
      'custom_colors': 'Couleurs personnalisées',
      'colors': 'Couleurs',
      'sidebar_active_background_color':
          'Couleur d\'arrière-plan de la barre latérale active',
      'sidebar_active_font_color':
          'Couleur de police de la barre latérale active',
      'sidebar_inactive_background_color':
          'Couleur d\'arrière-plan de la barre latérale inactive',
      'sidebar_inactive_font_color':
          'Couleur de police de la barre latérale inactive',
      'table_alternate_row_background_color':
          'Couleur d\'arrière-plan de la ligne alternative du tableau',
      'invoice_header_background_color':
          'Couleur d\'arrière-plan de l\'en-tête de facture',
      'invoice_header_font_color': 'Couleur de police de l\'en-tête de facture',
      'net_subtotal': 'Net',
      'review_app': 'Examen de l\'application',
      'check_status': 'Vérifier l\'état',
      'free_trial': 'Essai gratuit',
      'free_trial_ends_in_days':
          'L\'essai du plan Pro se termine dans :count jours, cliquez pour mettre à niveau.',
      'free_trial_ends_today':
          'Aujourd\'hui est le dernier jour de l\'essai du plan Pro, cliquez pour mettre à niveau.',
      'change_email': 'Changer l\'e-mail',
      'client_portal_domain_hint':
          'Configurez éventuellement un domaine de portail client distinct',
      'tasks_shown_in_portal': 'Tâches affichées dans le portail',
      'uninvoiced': 'Non facturé',
      'subdomain_guide':
          'Le sous-domaine est utilisé dans le portail client pour personnaliser les liens en fonction de votre marque. c\'est-à-dire https://your-brand.invoicing.co',
      'send_time': 'Heure d\'envoi',
      'import_data': 'Importer des données',
      'import_settings': 'Importer les configurations',
      'json_file_missing': 'Veuillez fournir le fichier JSON',
      'json_option_missing':
          'Veuillez sélectionner pour importer les paramètres et/ou les données',
      'json': 'JSON',
      'no_payment_types_enabled': 'Aucun type de paiement activé',
      'wait_for_data': 'Veuillez attendre la fin du chargement des données',
      'net_total': 'Total net',
      'has_taxes': 'A des impôts',
      'import_customers': 'Importer des clients',
      'imported_customers': 'L\'importation de clients a démarré avec succès',
      'login_success': 'Connexion réussie',
      'login_failure': 'Échec de la connexion',
      'exported_data':
          'Lorsque le fichier sera prêt, vous recevrez un courriel avec un lien de téléchargement',
      'include_deleted_clients': 'Inclure les clients supprimés',
      'include_deleted_clients_help':
          'Charger les enregistrements appartenant aux clients supprimés',
      'step_1_sign_in': 'Étape 1 : Se connecter',
      'step_2_authorize': 'Étape 2 : Autoriser',
      'account_id': 'identifiant de compte',
      'migration_not_yet_completed': 'La migration n\'est pas encore terminée',
      'activity_100': ':user a créé une facture récurrente :recurring_invoice',
      'activity_101':
          ':user a mis à jour une facture récurrente :recurring_invoice',
      'activity_102':
          ':user a archivé une facture récurrente :recurring_invoice',
      'activity_103':
          ':user a supprimé une facture récurrente :recurring_invoice',
      'activity_104':
          ':user a restauré une facture récurrente :recurring_invoice',
      'show_task_end_date': 'Afficher la date de fin d\'une tâche',
      'show_task_end_date_help':
          'Activer la spécification de la date de fin de la tâche',
      'gateway_setup': 'Configuration de la passerelle',
      'preview_sidebar': 'Prévisualiser la barre latérale',
      'years_data_shown': 'Années données affichées',
      'ended_all_sessions': 'Terminé avec succès toutes les sessions',
      'end_all_sessions': 'Terminer toutes les sessions',
      'count_session': '1 séance',
      'count_sessions': ':count Sessions',
      'invoice_created': 'Facture créée',
      'quote_created': 'Devis créé',
      'credit_created': 'Crédit créé',
      'pro': 'Pro',
      'enterprise': 'Entreprise',
      'last_updated': 'Dernière mise à jour',
      'invoice_item': 'Article de facture',
      'quote_item': 'Article de devis',
      'contact_first_name': 'Prénom du contact',
      'contact_last_name': 'Nom du contact',
      'order': 'Commande',
      'unassigned': 'Non assigné',
      'partial_value': 'Doit être supérieur à zéro et inférieur au total',
      'search_kanban': 'Recherche Kanban',
      'search_kanbans': 'Recherche Kanban',
      'kanban': 'Kanban',
      'enable': 'Activer',
      'move_top': 'Déplacer vers le haut',
      'move_up': 'Déplacer vers le haut',
      'move_down': 'Descendre',
      'move_bottom': 'Déplacer vers le bas',
      'subdomain_help':
          'Définissez un sous-domaine ou affichez la facture sur votre propre site web.',
      'body_variable_missing':
          'Erreur : l\'e-mail personnalisé doit inclure une variable :body',
      'add_body_variable_message': 'Assurez-vous d\'inclure une variable :body',
      'view_date_formats': 'Afficher les formats de date',
      'is_viewed': 'Est visualisé',
      'letter': 'Lettre',
      'legal': 'Juridique',
      'page_layout': 'Orientation de page',
      'portrait': 'Portrait',
      'landscape': 'Paysage',
      'owner_upgrade_to_paid_plan':
          'Le titulaire du compte peut passer à un forfait payant pour activer les paramètres avancés avancés',
      'upgrade_to_paid_plan':
          'Passez à un forfait payant pour activer les paramètres avancés',
      'invoice_payment_terms': 'Conditions de paiement des factures',
      'quote_valid_until': 'Offre valable jusqu\'au',
      'no_headers': 'Aucun en-tête',
      'add_header': 'Ajouter un en-tête',
      'remove_header': 'Supprimer l\'en-tête',
      'return_url': 'URL de retour',
      'rest_method': 'Méthode REST',
      'header_key': 'Clé d\'en-tête',
      'header_value': 'Valeur d\'en-tête',
      'recurring_products': 'Produits récurrents',
      'promo_code': 'Code promo',
      'promo_discount': 'Remise promotionnelle',
      'allow_cancellation': 'Autoriser l\'annulation',
      'per_seat_enabled': 'Par siège activé',
      'max_seats_limit': 'Limite maximale de sièges',
      'trial_enabled': 'Essai activé',
      'trial_duration': 'Durée de l\'essai',
      'allow_query_overrides': 'Autoriser les remplacements de requête',
      'allow_plan_changes': 'Autoriser les modifications de forfait',
      'plan_map': 'Planifier la carte',
      'refund_period': 'Période de remboursement',
      'webhook_configuration': 'Configuration du webhook',
      'purchase_page': 'Page d\'achat',
      'security': 'Sécurité',
      'email_bounced': 'E-mail renvoyé',
      'email_spam_complaint': 'Plainte pour spam',
      'email_delivery': 'Livraison par e-mail',
      'webhook_response': 'Réponse Webhook',
      'pdf_response': 'Réponse PDF',
      'authentication_failure': 'Échec d\'authentification',
      'pdf_failed': 'Échec du PDF',
      'pdf_success': 'Succès PDF',
      'modified': 'Modifié',
      'payment_link': 'Lien de paiement',
      'new_payment_link': 'Nouveau lien de paiement',
      'edit_payment_link': 'Modifier le lien de paiement',
      'created_payment_link': 'Lien de paiement créé avec succès',
      'updated_payment_link': 'Lien de paiement mis à jour avec succès',
      'archived_payment_link': 'Lien de paiement archivé avec succès',
      'deleted_payment_link': 'Lien de paiement supprimé avec succès',
      'removed_payment_link': 'Lien de paiement supprimé avec succès',
      'restored_payment_link': 'Lien de paiement restauré avec succès',
      'search_payment_link': 'Rechercher 1 lien de paiement',
      'search_payment_links': 'Rechercher :count liens de paiement',
      'subdomain_is_not_available': 'Le sous-domaine n\'est pas disponible',
      'connect_gmail': 'Connecter Gmail',
      'disconnect_gmail': 'Déconnecter Gmail',
      'connected_gmail': 'Gmail connecté avec succès',
      'disconnected_gmail': 'Gmail a bien été déconnecté',
      'update_fail_help':
          'Les modifications apportées à la base de code peuvent bloquer la mise à jour, vous pouvez exécuter cette commande pour annuler les modifications :',
      'client_id_number': 'Numéro d\'identification du client',
      'count_minutes': ':count les minutes',
      'password_timeout': 'Délai d\'expiration du mot de passe',
      'shared_invoice_credit_counter':
          'Partager le compteur pour les factures et les crédits',
      'use_last_email': 'Utiliser le dernier e-mail',
      'activate_company': 'Activer la société',
      'activate_company_help':
          'Activer les e-mails, factures récurrentes et notifications',
      'an_error_occurred_try_again':
          'Une erreur s\'est produite, veuillez réessayer',
      'please_first_set_a_password':
          'Veuillez d\'abord définir un mot de passe',
      'changing_phone_disables_two_factor':
          'Attention: Le changement de votre numéro de téléphone va désactiver la 2FA',
      'help_translate': 'Aidez à traduire',
      'please_select_a_country': 'Veuillez sélectionner un pays',
      'resend_invite': 'Renvoyer une invitation',
      'disabled_two_factor': 'la 2FA a été désactivée avec succès',
      'connected_google': 'Compte connecté avec succès',
      'disconnected_google': 'Compte déconnecté avec succès',
      'delivered': 'Livré',
      'bounced': 'Rebondi',
      'spam': 'Courrier indésirable',
      'view_docs': 'Afficher la documentation',
      'enter_phone_to_enable_two_factor':
          'Veuillez fournir un numéro de téléphone mobile pour activer l\'authentification à deux facteurs',
      'send_sms': 'Envoyer un SMS',
      'sms_code': 'Code SMS',
      'two_factor_setup_help':
          'Scannez le code à barres avec une application compatible :link',
      'enabled_two_factor':
          'Authentification à deux facteurs activée avec succès',
      'connect_google': 'Connecter Google',
      'disconnect_google': 'Déconnecter Google',
      'enable_two_factor': 'Authentification à 2 facteurs',
      'disable_two_factor': 'Désactiver deux facteurs',
      'require_password_with_social_login':
          'Exiger un mot de passe avec connexion sociale',
      'stay_logged_in': 'Rester connecté',
      'session_about_to_expire':
          'Avertissement : Votre session est sur le point d\'expirer',
      'count_hours': ':count les heures',
      'count_day': 'Un jour',
      'count_days': ':count les jours',
      'web_session_timeout': 'Délai d\'expiration de la session Web',
      'security_settings': 'Paramètres de sécurité',
      'resend_email': 'Ré-envoyer l\'email',
      'confirm_your_email_address': 'Merci de confirmer votre adresse e-mail',
      'refunded_payment': 'Paiement remboursé',
      'partially_unapplied': 'Partiellement non appliqué',
      'select_a_gmail_user':
          'Veuillez sélectionner un utilisateur authentifié avec Gmail',
      'list_long_press': 'Appuyez longuement sur la liste',
      'show_actions': 'Afficher les actions',
      'start_multiselect': 'Démarrer la multisélection',
      'email_sent_to_confirm_email':
          'Un e-mail a été envoyé pour confirmer l\'adresse e-mail',
      'counter_pattern_error':
          'Pour utiliser :client_counter, veuillez ajouter :client_number ou :client_id_number pour éviter les conflits',
      'this_quarter': 'Ce trimestre',
      'last_quarter': 'Dernier trimestre',
      'to_update_run': 'Pour mettre à jour exécuter',
      'convert_to_invoice': 'Convertir en facture',
      'registration_url': 'URL d\'inscription',
      'invoice_project': 'Facturer le projet',
      'invoice_task': 'Facturer la tâche',
      'invoice_expense': 'Facturer la dépense',
      'search_payment_term': 'Rechercher 1 délai de paiement',
      'search_payment_terms': 'Rechercher :count les conditions de paiement',
      'save_and_preview': 'Enregistrer et prévisualiser',
      'save_and_email': 'Enregistrer et envoyer par courriel',
      'supported_events': 'Événements pris en charge',
      'converted_amount': 'Montant converti',
      'converted_balance': 'Solde converti',
      'converted_paid_to_date': 'Converti payé à ce jour',
      'converted_credit_balance': 'Solde créditeur converti',
      'converted_total': 'Total converti',
      'is_sent': 'Est envoyé',
      'default_documents': 'Documents par défaut',
      'document_upload': 'Téléverser un document',
      'document_upload_help': 'Activer l\'envoi de documents par les clients',
      'expense_total': 'Total des dépenses',
      'enter_taxes': 'Entrer les taxes',
      'by_rate': 'Par tarif',
      'by_amount': 'Par montant',
      'enter_amount': 'Entrer le montant',
      'before_taxes': 'Avant taxes',
      'after_taxes': 'Après impôts',
      'color': 'Couleur',
      'show': 'Montrer',
      'hide': 'Cacher',
      'empty_columns': 'Colonne vide',
      'debug_mode_is_enabled': 'Le mode débogage est activé',
      'debug_mode_is_enabled_help':
          'Attention : il est destiné à être utilisé sur des machines locales, il peut faire fuir les informations d\'identification. Cliquez pour en savoir plus.',
      'running_tasks': 'Exécution de tâches',
      'recent_tasks': 'Tâches récentes',
      'recent_expenses': 'Dépenses récentes',
      'upcoming_expenses': 'Dépenses à venir',
      'update_app': 'Mettre à jour l\'App',
      'started_import': 'L\'importation a démarré avec succès',
      'duplicate_column_mapping': 'Dupliquer le mappage de colonnes',
      'uses_inclusive_taxes': 'Utiliser les taxes incluses',
      'is_amount_discount': 'Est le Montant de la remise',
      'column': 'Colonne',
      'sample': 'Exemple',
      'map_to': 'Mapper vers',
      'import': 'Importer',
      'first_row_as_column_names':
          'Utiliser la première ligne comme noms des colonnes',
      'select_file': 'Veuillez sélectionner un fichier',
      'no_file_selected': 'Aucun fichier sélectionné',
      'csv_file': 'Sélectionner un fichier CSV',
      'csv': 'CSV',
      'freshbooks': 'FreshBooks',
      'invoice2go': 'Invoice2go',
      'invoicely': 'Invoicely',
      'waveaccounting': 'Wave Accounting',
      'zoho': 'Zoho',
      'accounting': 'Comptabilité',
      'required_files_missing': 'Merci de fournir tous les CSV',
      'import_type': 'Type d\'importation',
      'html_mode': 'Mode HTML',
      'html_mode_help': 'Aperçu des mises à jour plus rapide mais moins précis',
      'view_licenses': 'Voir les licences',
      'webhook_url': 'URL Webhook',
      'fullscreen_editor': 'Éditeur plein écran',
      'sidebar_editor': 'Editeur de barre latérale',
      'please_type_to_confirm': 'Veuillez entrer \':value\' pour confirmer',
      'purge': 'Purger',
      'service': 'Service',
      'clone_to': 'Cloner en',
      'clone_to_other': 'Cloner en \'Autre\'',
      'labels': 'Labels',
      'add_custom': 'Ajouter',
      'payment_tax': 'Taxe sur le paiement',
      'expense_tax': 'Expense Tax',
      'unpaid': 'Non payé',
      'white_label': 'Marque blanche',
      'delivery_note': 'Bon de livraison',
      'sent_invoices_are_locked': 'Les factures envoyées sont verrouillées',
      'paid_invoices_are_locked': 'Les factures payées sont verrouillées',
      'source_code': 'Code source',
      'app_platforms': 'Plateformes d\'app',
      'invoice_late': 'Facture en retard',
      'quote_expired': 'Devis expiré',
      'partial_due': 'Acompte à verser',
      'invoice_total': 'Montant total',
      'quote_total': 'Montant du devis',
      'credit_total': 'Total Crédit',
      'recurring_invoice_total': 'Total facture',
      'actions': 'Actions',
      'expense_number': 'N° dépense',
      'task_number': 'N° tâche',
      'project_number': 'N° projet',
      'project_name': 'nom du projet',
      'warning': 'Avertissement',
      'view_settings': 'Voir les paramètres',
      'company_disabled_warning':
          'Attention : cette société n\'a pas encore été activée',
      'late_invoice': 'Facture en retard',
      'expired_quote': 'Devis périmé',
      'remind_invoice': 'Rappeler la facture',
      'cvv': 'Cryptogramme visuel',
      'client_name': 'Nom du client',
      'client_phone': 'Téléphone client',
      'required_fields': 'Champs requis',
      'calculated_rate': 'Taux Calculé',
      'default_task_rate': 'Taux par défaut de la tâche',
      'clear_cache': 'Effacer le cache',
      'sort_order': 'Ordre de tri',
      'task_status': 'Statut',
      'task_statuses': 'Statuts des tâches',
      'new_task_status': 'Nouveau statut de tâche',
      'edit_task_status': 'Modifier les statuts de tâches',
      'created_task_status': 'Statut de tâche créé',
      'updated_task_status': 'Statut de tâche mis à jour avec succès',
      'archived_task_status': 'Statut de tâche archivé',
      'deleted_task_status': 'Statut de tâche supprimé',
      'removed_task_status': 'Statut de la tâche supprimé avec succès',
      'restored_task_status': 'Statut de la tâche restauré avec succès',
      'archived_task_statuses':
          'Les états de tâche :value ont bien été archivés',
      'deleted_task_statuses':
          'Les états de tâche :value ont bien été supprimés',
      'restored_task_statuses':
          'Les états de tâche :value ont bien été restaurés',
      'search_task_status': 'Recherche 1 état de tâche',
      'search_task_statuses': 'Recherche :count états de tâche',
      'show_tasks_table': 'Afficher la table des tâches',
      'show_tasks_table_help':
          'Toujours montrer la section des tâches lors de la création de factures',
      'invoice_task_timelog': 'Facturer le journal du temps des tâches',
      'invoice_task_timelog_help':
          'Ajouter les détails de temps aux lignes d\'articles des factures',
      'invoice_task_datelog': 'Journal des tâches de facturation',
      'invoice_task_datelog_help':
          'Ajouter des détails de date aux éléments de ligne de facture',
      'auto_start_tasks_help': 'Démarrer les tâches avant d\'enregistrer',
      'configure_statuses': 'Configurer les statuts',
      'task_settings': 'Réglages des tâches',
      'configure_categories': 'Configurer les catégories',
      'expense_categories': 'catégories de dépense',
      'new_expense_category': 'Nouvelle catégorie de dépense',
      'edit_expense_category': 'Editer la catégorie de dépense',
      'created_expense_category': 'Catégorie de dépense créée avec succès',
      'updated_expense_category':
          'Catégorie de dépense mise à jour avec succès',
      'archived_expense_category': 'Catégorie de dépense archivée avec succès',
      'deleted_expense_category': 'La catégorie a été supprimée avec succès',
      'removed_expense_category': 'Catégorie de dépense supprimée avec succès',
      'restored_expense_category': 'Catégorie de dépense restaurée avec succès',
      'archived_expense_categories':
          ':count catégorie(s) de dépense archivée(s) avec succès',
      'deleted_expense_categories':
          'Les catégories de dépense :value ont bien été supprimées',
      'restored_expense_categories':
          'Les catégories de dépense :value ont bien été restaurées',
      'search_expense_category': 'Recherche 1 catégorie de dépense',
      'search_expense_categories': 'Recherche :count catégories de dépense',
      'use_available_credits': 'Utiliser les crédits disponibles',
      'show_option': 'Montrer l\'option',
      'negative_payment_error':
          'Le montant du crédit ne peut pas dépasser le montant du paiement',
      'view_changes': 'Voir les changements',
      'force_update': 'Forcer la mise à jour',
      'force_update_help':
          'Vous utilisez la dernière version mais il se peut que des corrections soient en attente.',
      'mark_paid_help': 'Suivez les dépenses qui ont été payées',
      'should_be_invoiced': 'Devrait être facturé',
      'should_be_invoiced_help': 'Activer la dépense pour être facturée',
      'add_documents_to_invoice_help':
          'Rendre les documents visibles pour le client',
      'convert_currency_help': 'Définir un taux de change',
      'expense_settings': 'Réglages des dépenses',
      'clone_to_recurring': 'Cloner en récurrence',
      'crypto': 'Crypto',
      'paypal': 'PayPal',
      'alipay': 'Alipay',
      'sofort': 'Sofort',
      'apple_pay': 'Apple/Google Pay',
      'user_field': 'Champs utilisateur',
      'variables': 'Variables',
      'show_password': 'Montrer le mot de passe',
      'hide_password': 'Cacher le mot de passe',
      'copy_error': 'Erreur de copie',
      'capture_card': 'Carte saisie',
      'auto_bill_enabled': 'Autofacturation activée',
      'total_taxes': 'Taxes totales',
      'line_taxes': 'Taxes par ligne',
      'total_fields': 'Champs des totaux',
      'stopped_recurring_invoice':
          'La facture récurrente a été arrêtée avec succès',
      'started_recurring_invoice':
          'La facture récurrente a été démarrée avec succès',
      'resumed_recurring_invoice':
          'La facture récurrente a été reprise avec succès',
      'gateway_refund': 'Remboursement de passerelle',
      'gateway_refund_help':
          'Procéder au remboursement avec la passerelle de paiement',
      'due_date_days': 'Date d\'échéance',
      'paused': 'En pause',
      'mark_active': 'Marquer comme actif',
      'day_count': 'Jour :count',
      'first_day_of_the_month': 'Premier jour du mois',
      'last_day_of_the_month': 'Dernier jour du mois',
      'use_payment_terms': 'Utiliser les délais de paiement',
      'endless': 'Sans fin',
      'next_send_date': 'Prochaine date d\'envoi',
      'remaining_cycles': 'Cycles restant',
      'recurring_invoice': 'Facture récurrente',
      'recurring_invoices': 'Factures récurrentes',
      'new_recurring_invoice': 'Nouvelle facture récurrente',
      'edit_recurring_invoice': 'Editer facture récurrente',
      'created_recurring_invoice':
          'La facture récurrente a été créée avec succès',
      'updated_recurring_invoice':
          'La facture récurrente a été mise à jour avec succès',
      'archived_recurring_invoice': 'Facture récurrente archivée avec succès',
      'deleted_recurring_invoice': 'Facture récurrente supprimée avec succès',
      'removed_recurring_invoice':
          'La facture récurrente a été retirée avec succès',
      'restored_recurring_invoice': 'Facture récurrente restaurée avec succès',
      'archived_recurring_invoices':
          'Les factures récurrentes :value ont bien été archivées',
      'deleted_recurring_invoices':
          'Les factures récurrentes :value ont bien été supprimées',
      'restored_recurring_invoices':
          'Les factures récurrentes :value ont bien été restaurées',
      'search_recurring_invoice': 'Recherche 1 facture récurrente',
      'search_recurring_invoices': 'Recherche :count factures récurrentes',
      'send_date': 'Date d\'envoi',
      'auto_bill_on': 'Autofacturer le',
      'minimum_under_payment_amount': 'Montant minimum de sous-paiement',
      'profit': 'Profit',
      'line_item': 'Ligne d\'article',
      'allow_over_payment': 'Autoriser le trop-payé',
      'allow_over_payment_help':
          'Accepter le paiement supplémentaire pour pourboire',
      'allow_under_payment': 'Autoriser le sous-paiement',
      'allow_under_payment_help':
          'Supporter le paiement au minimum du montant de l\'acompte',
      'test_mode': 'Mode test',
      'opened': 'Ouvert(e)',
      'payment_reconciliation_failure': 'Conciliation non réussie',
      'payment_reconciliation_success': 'Conciliation réussie',
      'gateway_success': 'Passerelle réussie',
      'gateway_failure': 'Échec de passerelle',
      'gateway_error': 'Erreur de passerelle',
      'email_send': 'Envoi de l\'e-mail',
      'email_retry_queue': 'File d\'envoi de courriel',
      'failure': 'Échec',
      'quota_exceeded': 'Quota dépassé',
      'upstream_failure': 'Échec en amont',
      'system_logs': 'Logs système',
      'view_portal': 'Voir le portail',
      'copy_link': 'Copier le lien',
      'token_billing': 'Enregister les détails de paiement',
      'welcome_to_invoice_ninja': 'Bienvenue sur Invoice Ninja',
      'always': 'Toujours',
      'optin': 'Adhésion',
      'optout': 'Désadhésion',
      'label': 'Intitulé',
      'client_number': 'Numéro de client',
      'auto_convert': 'Convertir automatiquement',
      'company_name': 'Nom de l\'entreprise',
      'reminder1_sent': 'Rappel 1 envoyé',
      'reminder2_sent': 'Rappel 2 envoyé',
      'reminder3_sent': 'Rappel 3 envoyé',
      'reminder_last_sent': 'Dernier envoi de rappel',
      'pdf_page_info': 'Page :current sur :total',
      'emailed_invoices': 'Les factures ont été envoyées par email avec succès',
      'emailed_quotes': 'Les offres ont été envoyées par courriel avec succès',
      'emailed_credits': 'Les crédits ont été envoyés par e-mail avec succès',
      'gateway': 'Passerelle',
      'view_in_stripe': 'Voir dans Stripe',
      'rows_per_page': 'Lignes par page',
      'hours': 'Heures',
      'statement': 'Relevé',
      'taxes': 'Taxes',
      'surcharge': 'Majoration',
      'apply_payment': 'Appliquer le paiement',
      'apply_credit': 'Appliquer le crédit',
      'apply': 'Appliquer',
      'unapplied': 'Non appliqué',
      'select_label': 'Sélectionnez le label',
      'custom_labels': 'Labels personnalisés',
      'record_type': 'Type d\'enregistrement',
      'record_name': 'Nom d\'enregistrement',
      'file_type': 'Type de fichier',
      'height': 'Hauteur',
      'width': 'Largeur',
      'to': 'À',
      'health_check': 'État de santé',
      'payment_type_id': 'Type de paiement',
      'last_login_at': 'Dernière connexion',
      'company_key': 'Clé d\'entreprise',
      'storefront': 'Vitrine',
      'storefront_help': 'Autoriser les tierces parties à créer des factures',
      'client_created': 'Client créé',
      'online_payment_email': 'E-mail de paiement en ligne',
      'manual_payment_email': 'E-mail de paiement manuel',
      'completed': 'Effectué',
      'gross': 'Brut',
      'net_amount': 'Montant net',
      'net_balance': 'Solde net',
      'client_settings': 'Paramètres client',
      'selected_invoices': 'Factures sélectionnées',
      'selected_payments': 'Paiements sélectionnés',
      'selected_quotes': 'Devis sélectionnés',
      'selected_tasks': 'Tâches sélectionnées',
      'selected_expenses': 'Dépenses sélectionnées',
      'upcoming_invoices': 'Factures à venir',
      'past_due_invoices': 'Factures en retard',
      'recent_payments': 'Paiements récents',
      'upcoming_quotes': 'Devis à venir',
      'expired_quotes': 'Devis expirés',
      'create_client': 'Créer un client',
      'create_invoice': 'Créer une facture',
      'create_quote': 'Créer un devis',
      'create_payment': 'Nouveau paiement',
      'create_vendor': 'Créer un fournisseur',
      'update_quote': 'Mettre à jour le devis',
      'delete_quote': 'Supprimer ce devis',
      'update_invoice': 'Mettre à jour la facture',
      'delete_invoice': 'Supprimer la facture',
      'update_client': 'Mettre à jour le client',
      'delete_client': 'Supprimer ce client',
      'delete_payment': 'Supprimer ce paiement',
      'update_vendor': 'Mettre à jour le fournisseur',
      'delete_vendor': 'Supprimer ce fournisseur',
      'create_expense': 'Nouvelle dépense',
      'update_expense': 'Mettre à jour la dépense',
      'delete_expense': 'Supprimer la dépense',
      'create_task': 'Créer une tâche',
      'update_task': 'Mettre à jour la tâche',
      'delete_task': 'Supprimer la tâche',
      'approve_quote': 'Approuver le devis',
      'off': 'Desactivé',
      'when_paid': 'Lors du paiement',
      'expires_on': 'Expire le',
      'free': 'Gratuit',
      'plan': 'Plan',
      'show_sidebar': 'Afficher la barre latérale',
      'hide_sidebar': 'Masquer la barre latérale',
      'event_type': 'Type d\'événement',
      'target_url': 'Cible',
      'copy': 'Copier',
      'must_be_online':
          'Veuillez redémarrer l\'application lorsque vous serez connecté à internet',
      'crons_not_enabled': 'Les crons doivent être activés',
      'api_webhooks': 'API Webhooks',
      'search_webhooks': 'Recherche de :count Webhooks',
      'search_webhook': 'Recherche de 1 Webhook',
      'webhook': 'Webhook',
      'webhooks': 'Webhooks',
      'new_webhook': 'Nouveau Webhook',
      'edit_webhook': 'Modifier le Webhook',
      'created_webhook': 'Le webhook a été créé avec succès',
      'updated_webhook': 'Le webhook a été mis à jour avec succès',
      'archived_webhook': 'Le webhook a été archivé avec succès',
      'deleted_webhook': 'Le webhook a été supprimé avec succès',
      'removed_webhook': 'Le webhook a été retiré avec succès',
      'restored_webhook': 'Le webhook a été restauré avec succès',
      'archived_webhooks': 'Les :value webhooks ont été archivés avec succès',
      'deleted_webhooks': 'Les :value webhooks ont été supprimés avec succès',
      'removed_webhooks': 'Les :value webhooks ont été retirés avec succès',
      'restored_webhooks': 'Les :value tâches ont été restaurées avec succès',
      'api_tokens': 'Jetons d\'API',
      'api_docs': 'Documentation des API',
      'search_tokens': 'Recherche de :count jetons',
      'search_token': 'Recherche de 1 jeton',
      'token': 'Jeton',
      'tokens': 'Jetons',
      'new_token': 'Nouveau jeton',
      'edit_token': 'Éditer ce jeton',
      'created_token': 'Jeton créé avec succès',
      'updated_token': 'Jeton mis à jour avec succès',
      'archived_token': 'Jeton archivé avec succès',
      'deleted_token': 'Jeton supprimé avec succès',
      'removed_token': 'Le jeton a été retiré avec succès',
      'restored_token': 'Le jeton a été restauré avec succès',
      'archived_tokens': 'Les :value jetons ont été archivés avec succès',
      'deleted_tokens': 'Les :value jetons ont été supprimés avec succès',
      'restored_tokens': 'Les :value jetons ont été restaurés avec succès',
      'client_registration': 'Enregistrement client',
      'client_registration_help':
          'Autoriser les clients à s\'enregistrer sur le portail',
      'email_invoice': 'Envoyer la facture par e-mail',
      'email_quote': 'Envoyer ce devis par e-mail',
      'email_credit': 'Crédit par mail',
      'email_payment': 'Reçu du paiement par courriel',
      'client_email_not_set': 'Le client n\'a pas d\'adresse mail définie',
      'ledger': 'Grand livre',
      'view_pdf': 'Voir PDF',
      'all_records': 'Tous les enregistrements',
      'owned_by_user': 'Propriété de l\'utilisateur',
      'credit_remaining': 'Crédit restant',
      'contact_name': 'Nom du contact',
      'use_default': 'Utiliser la valeur par défaut',
      'reminder_endless': 'Rappels infinis',
      'number_of_days': 'Nombre de jours',
      'configure_payment_terms': 'Configurer les conditions de paiements',
      'payment_term': 'Condition de paiement',
      'new_payment_term': 'Nouvelle condition de paiement',
      'edit_payment_term': 'Éditer la condition de paiement',
      'created_payment_term': 'Conditions de paiement créées avec succès',
      'updated_payment_term': 'Conditions de paiement mises à jour avec succès',
      'archived_payment_term': 'Conditions de paiement archivées avec succès',
      'deleted_payment_term': 'Condition de paiement retiré avec succès',
      'removed_payment_term': 'Condition de paiement retiré avec succès',
      'restored_payment_term':
          'Les conditions de paiements ont été restaurés avec succès',
      'archived_payment_terms':
          'Les :value délais de paiement ont été archivés avec succès',
      'deleted_payment_terms':
          'Suppression réussie :value des conditions de paiement',
      'restored_payment_terms':
          'Restauration réussie :value des conditions de paiement',
      'email_sign_in': 'S\'identifier avec l\'email',
      'change': 'Modifier',
      'change_to_mobile_layout': 'Modifier la mise en page pour le mobile ?',
      'change_to_desktop_layout': 'Basculer vers l\'affichage ordinateur',
      'send_from_gmail': 'Envoyer depuis Gmail',
      'reversed': 'Inversé',
      'cancelled': 'Annulé',
      'credit_amount': 'Montant du crédit',
      'quote_amount': 'Montant devis',
      'hosted': 'Hébergé',
      'selfhosted': 'Auto-hébergé',
      'exclusive': 'Exclusif',
      'inclusive': 'Inclusif',
      'hide_menu': 'Masquer le menu',
      'show_menu': 'Afficher le menu',
      'partially_refunded': 'Remboursé partiellement',
      'search_documents': 'Rechercher des documents',
      'search_designs': 'Rechercher des modèles',
      'search_invoices': 'Rechercher des factures',
      'search_clients': 'Rechercher des clients',
      'search_products': 'Rechercher des produits',
      'search_quotes': 'Rechercher des devis',
      'search_credits': 'Recherche de crédits',
      'search_vendors': 'Recherche de fournisseurs',
      'search_users': 'Rechercher des utilisateurs',
      'search_tax_rates': 'Recherche de taux de taxe',
      'search_tasks': 'Rechercher des tâches',
      'search_settings': 'Rechercher des paramètres',
      'search_projects': 'Rechercher des projets',
      'search_expenses': 'Rechercher des dépenses',
      'search_payments': 'Rechercher des règlements',
      'search_groups': 'Rechercher des groupes',
      'search_company': 'Rechercher des entreprises',
      'search_document': 'Recherche de 1 document',
      'search_design': 'Recherche de 1 design',
      'search_invoice': 'Recherche de 1 facture',
      'search_client': 'Recherche de 1 client',
      'search_product': 'Recherche de 1 produit',
      'search_quote': 'Rechercher un devis',
      'search_credit': 'Recherche de 1 crédit',
      'search_vendor': 'Recherche de 1 fournisseurs',
      'search_user': 'Recherche de 1 utilisateur',
      'search_tax_rate': 'Recherche de 1 taux de taxe',
      'search_task': 'Recherche de 1 tâche',
      'search_project': 'Recherche de 1 projet',
      'search_expense': 'Recherche de 1 dépense',
      'search_payment': 'Recherche de 1 paiement',
      'search_group': 'Recherche de 1 groupe',
      'refund_payment': 'Remboursement du paiement',
      'cancelled_invoice': 'Facture annulée',
      'cancelled_invoices': 'Factures annulées',
      'reversed_invoice': 'La facture a été inversée avec succès',
      'reversed_invoices': 'Les factures ont été inversées avec succès',
      'reverse': 'Inverse',
      'full_name': 'Nom complet',
      'city_state_postal': 'Ville/ Province (Département)/ CP',
      'postal_city_state': 'Code postal/Ville/Province (Département)',
      'custom1': 'Personnalisé1',
      'custom2': 'Personnalisé2',
      'custom3': 'Troisième champ personnalisé',
      'custom4': 'Quatrième champ personnalisé',
      'optional': 'Optionnel',
      'license': 'Licence',
      'purge_data': 'Purger les données',
      'purge_successful':
          'Les données de l\'entreprise ont été purgées avec succès',
      'purge_data_message':
          'Attention : Cette action va supprimer vos données et est irréversible',
      'invoice_balance': 'Solde facture',
      'age_group_0': '0 - 30 jours',
      'age_group_30': '30 -60 jours',
      'age_group_60': '60 - 90 jours',
      'age_group_90': '90 - 120 jours',
      'age_group_120': '120+ jours',
      'refresh': 'Rafraîchir',
      'saved_design': 'Design enregistré',
      'client_details': 'Coordonnées du client',
      'company_address': 'Adresse de l\'entreprise',
      'invoice_details': 'Détails de la facture',
      'quote_details': 'Détail du devis',
      'credit_details': 'Détails du crédit',
      'product_columns': 'Colonnes de produits',
      'task_columns': 'Colonnes de tâches',
      'add_field': 'Ajouter un champ',
      'all_events': 'Tous les événements',
      'permissions': 'Permissions',
      'none': 'Aucun(e)',
      'owned': 'Propriétaire',
      'payment_success': 'Paiement réussi',
      'payment_failure': 'Échec du paiement',
      'invoice_sent': ':count facture envoyée',
      'quote_sent': 'Devis envoyé',
      'credit_sent': 'Crédit envoyé',
      'invoice_viewed': 'Facture vue',
      'quote_viewed': 'Devis vue',
      'credit_viewed': 'Crédit vue',
      'quote_approved': 'Devis approuvé',
      'receive_all_notifications': 'Recevoir toutes les notifications',
      'purchase_license': 'Acheter une licence',
      'apply_license': 'Activer la licence',
      'cancel_account': 'Supprimer le compte',
      'cancel_account_message':
          'Attention : Ceci va supprimer définitivement votre compte, il n\'y a pas d\'annulation possible.',
      'delete_company': 'Supprimer la société',
      'delete_company_message':
          'Attention : Ceci supprimera définitivement votre société, il n\'y a pas d\'annulation.',
      'enabled_modules': 'Modules activés',
      'converted_quote': 'La devis a été converti avec succès',
      'credit_design': 'Modèle de crédit',
      'includes': 'Inclus',
      'header': 'En-tête',
      'load_design': 'Charger un modèle',
      'css_framework': 'Framework CSS',
      'custom_designs': 'Modèles personnalisés',
      'designs': 'Modèles',
      'new_design': 'Nouveau modèle',
      'edit_design': 'Éditer le modèle',
      'created_design': 'Le modèle a été créé avec succès',
      'updated_design': 'Le modèle a été mis à jour avec succès',
      'archived_design': 'Le modèle a été archivé avec succès',
      'deleted_design': 'Le modèle a été supprimé avec succès',
      'removed_design': 'Le modèle a été retiré avec succès',
      'restored_design': 'Le modèle a été restauré avec succès',
      'archived_designs': 'Les :value modèles ont été archivés avec succès',
      'deleted_designs': 'Les :value modèles ont été supprimés avec succès',
      'restored_designs': 'Les :value modèles ont été restaurés avec succès',
      'proposals': 'Propositions',
      'tickets': 'Billets',
      'recurring_quotes': 'Devis récurrent',
      'recurring_tasks': 'Tâches récurrentes',
      'account_management': 'Gestion des comptes',
      'credit_date': 'Date d\'avoir',
      'credit': 'Crédit',
      'credits': 'Crédits',
      'new_credit': 'Entrer un crédit',
      'edit_credit': 'Éditer le crédit',
      'created_credit': 'Crédit créé avec succès',
      'updated_credit': 'Le crédit a été mis à jour avec succès',
      'archived_credit': 'Crédit archivé avec succès',
      'deleted_credit': 'Crédit supprimé avec succès',
      'removed_credit': 'Le crédit a été retiré avec succès',
      'restored_credit': 'Crédit restauré avec succès',
      'archived_credits': ':count crédits archivés avec succès',
      'deleted_credits': ':count crédits supprimés avec succès',
      'restored_credits': 'Les :value crédits ont été restaurés avec succès',
      'current_version': 'Version actuelle',
      'latest_version': 'Dernière version',
      'update_now': 'Mettre à jour',
      'a_new_version_is_available':
          'Une nouvelle version de l\'application web est disponible',
      'update_available': 'Mise à jour disponible',
      'app_updated': 'La mise à jour a été complétée avec succès',
      'learn_more': 'En savoir plus',
      'integrations': 'Intégrations',
      'tracking_id': 'ID de suivi',
      'slack_webhook_url': 'URL du Webhook Slack',
      'credit_footer': 'Pied de page des credits',
      'credit_terms': 'Conditions d\'utilisation pour crédit',
      'new_company': 'Nouveau compte',
      'added_company': 'L\'entreprise a été ajoutée',
      'company1': 'Champ personnalisé Entreprise 1',
      'company2': 'Champ personnalisé Entreprise 2',
      'company3': 'Champ personnalisé Entreprise 3',
      'company4': 'Champ personnalisé Entreprise 4',
      'product1': 'Champ personnalisé Produit 1',
      'product2': 'Champ personnalisé Produit 2',
      'product3': 'Champ personnalisé Produit 3',
      'product4': 'Champ personnalisé Produit 4',
      'client1': 'Champ personnalisé Client 1',
      'client2': 'Client personnalisé 2',
      'client3': 'Client personnalisé 3',
      'client4': 'Client personnalisé 4',
      'contact1': 'Champ personnalisé Contact 1',
      'contact2': 'Champ personnalisé Contact 2',
      'contact3': 'Champ personnalisé Contact 3',
      'contact4': 'Champ personnalisé Contact 4',
      'task1': 'Champ personnalisé Tâche 1',
      'task2': 'Champ personnalisé Tâche 2',
      'task3': 'Champ personnalisé Tâche 3',
      'task4': 'Champ personnalisé Tâche 4',
      'project1': 'Champ personnalisé Projet 1',
      'project2': 'Champ personnalisé Projet 2',
      'project3': 'Champ personnalisé Projet 3',
      'project4': 'Champ personnalisé Projet 4',
      'expense1': 'Champ personnalisé Dépense 1',
      'expense2': 'Champ personnalisé Dépense 2',
      'expense3': 'Champ personnalisé Dépense 3',
      'expense4': 'Champ personnalisé Dépense 4',
      'vendor1': 'Fournisseur personnalisé 1',
      'vendor2': 'Fournisseur personnalisé 2',
      'vendor3': 'Fournisseur personnalisé 3',
      'vendor4': 'Fournisseur personnalisé 4',
      'invoice1': 'Champ personnalisé Facture 1',
      'invoice2': 'Champ personnalisé Facture 2',
      'invoice3': 'Champ personnalisé Facture 3',
      'invoice4': 'Champ personnalisé Facture 4',
      'payment1': 'Champ personnalisé Paiement 1',
      'payment2': 'Champ personnalisé Paiement 2',
      'payment3': 'Champ personnalisé Paiement 3',
      'payment4': 'Champ personnalisé Paiement 4',
      'surcharge1': 'Autre frais 1',
      'surcharge2': 'Autre frais 2',
      'surcharge3': 'Autre frais 3',
      'surcharge4': 'Autre frais 4',
      'group1': 'Champ personnalisé Groupe 1',
      'group2': 'Champ personnalisé Groupe 2',
      'group3': 'Champ personnalisé Groupe 3',
      'group4': 'Champ personnalisé Groupe 4',
      'reset': 'Remettre à zéro',
      'number': 'Numéro',
      'export': 'Exporter',
      'chart': 'Graphique',
      'count': 'Compte',
      'totals': 'Totaux',
      'blank': 'Vide',
      'day': 'Jour',
      'month': 'Mois',
      'year': 'Année',
      'subgroup': 'Sous-groupe',
      'is_active': 'Actif',
      'group_by': 'Grouper par',
      'credit_balance': 'Solde du crédit',
      'contact_last_login': 'Dernière connexion du contact',
      'contact_full_name': 'Nom du contact',
      'contact_phone': 'Téléphone du contact',
      'contact_custom_value1': 'Valeur champ personnalisé Contact 1',
      'contact_custom_value2': 'Valeur champ personnalisé Contact 2',
      'contact_custom_value3': 'Valeur champ personnalisé Contact 3',
      'contact_custom_value4': 'Valeur champ personnalisé Contact 4',
      'shipping_address1': 'Rue',
      'shipping_address2': 'Appt/Bâtiment',
      'shipping_city': 'Ville',
      'shipping_state': 'Région/Département',
      'shipping_postal_code': 'Code postal',
      'shipping_country': 'Pays',
      'billing_address1': 'Rue',
      'billing_address2': 'Appt/Bâtiment',
      'billing_city': 'Ville',
      'billing_state': 'Région/Département',
      'billing_postal_code': 'Code postal',
      'billing_country': 'Pays',
      'client_id': 'ID du client',
      'assigned_to': 'Assigné à',
      'created_by': 'Créé par :name',
      'assigned_to_id': 'Assigné à ID',
      'created_by_id': 'Créé par ID',
      'add_column': 'Ajouter une colonne',
      'edit_columns': 'Éditer les colonnes',
      'columns': 'Colonnes',
      'aging': 'Vieillissement',
      'profit_and_loss': 'Profits et Pertes',
      'reports': 'Rapports',
      'report': 'Rapport',
      'add_company': 'Ajouter compte',
      'unpaid_invoice': 'Facture impayée',
      'paid_invoice': 'Facture payée',
      'unapproved_quote': 'Devis non-approuvé',
      'help': 'Aide',
      'refund': 'Remboursement',
      'refund_date': 'Date du remboursement',
      'filtered_by': 'Filtré par',
      'contact_email': 'Courriel du contact',
      'multiselect': 'Sélection multiple',
      'entity_state': 'État',
      'verify_password': 'Vérifier le mot de passe',
      'applied': 'Publié',
      'include_recent_errors': 'Contient les erreurs récentes des journaux',
      'your_message_has_been_received':
          'Nous avons reçu votre message et répondrons dans les meilleurs délais',
      'message': 'Message',
      'from': 'De',
      'show_product_details': 'Voir les détails du produit',
      'show_product_details_help':
          'Inclure la description et le coût dans la liste déroulante du produit',
      'pdf_min_requirements':
          'Le générateur de PDF nécessite la version :version',
      'adjust_fee_percent': 'Ajuster le pourcentage de frais',
      'adjust_fee_percent_help': 'Ajuster le frais de pourcentage au compte',
      'configure_settings': 'Modifier les paramètres',
      'support_forum': 'Forums d&#39;assistance',
      'about': 'À propos',
      'documentation': 'Documentation',
      'contact_us': 'Nous joindre',
      'subtotal': 'Sous-total',
      'line_total': 'Total',
      'item': 'Article',
      'credit_email': 'Courriel de crédit',
      'iframe_url': 'URL iFrame',
      'domain_url': 'URL du domaine',
      'password_is_too_short': 'Mot de passe trop court',
      'password_is_too_easy':
          'Le mot de passe doit comporter au moins une majuscule et un nombre',
      'client_portal_tasks': 'Tâche du portail client',
      'client_portal_dashboard': 'Tableau de bord du portail client',
      'please_enter_a_value': 'Saisissez une valeur',
      'deleted_logo': 'Le logo a été supprimé',
      'yes': 'Oui',
      'no': 'Non',
      'generate_number': 'Générer un numéro',
      'when_saved': 'Lors de l\'enregistrement',
      'when_sent': 'Lors de l\'envoi',
      'select_company': 'Sélectionner une entreprise',
      'float': 'Flottant',
      'collapse': 'Réduire',
      'show_or_hide': 'Afficher/cacher',
      'menu_sidebar': 'Barre latérale du menu',
      'history_sidebar': 'Historique latéral',
      'tablet': 'Tablette',
      'mobile': 'Mobile',
      'desktop': 'Bureau',
      'layout': 'Présentation',
      'view': 'Voir',
      'module': 'Module',
      'first_custom': 'Premier personnalisé',
      'second_custom': 'Second personnalisé',
      'third_custom': 'Troisième personnalisé',
      'show_cost': 'Voir le coût',
      'show_product_cost': 'Afficher les coûts des produits',
      'show_cost_help':
          'Afficher un champ coût du produit pour suivre la marge',
      'show_product_quantity': 'Voir la quantité du produit',
      'show_product_quantity_help':
          'Afficher un champ de quantité du produit, sinon en choisir un par défaut',
      'show_invoice_quantity': 'Voir la quantité sur la facture',
      'show_invoice_quantity_help':
          'Afficher un champ de quantité pour la position, sinon en choisir un par défaut',
      'show_product_discount': 'Afficher les réductions des produits',
      'show_product_discount_help':
          'Afficher un champ de réduction pour la position',
      'default_quantity': 'Quantité par défaut',
      'default_quantity_help':
          'Mettre automatiquement la quantité de la position à un',
      'one_tax_rate': 'Un taux de taxe',
      'two_tax_rates': 'Deux taux de taxe',
      'three_tax_rates': 'Trois taux de taxe',
      'default_tax_rate': 'Taux de taxe par défaut',
      'user': 'Utilisateur',
      'invoice_tax': 'Taxe de la facture',
      'line_item_tax': 'Taxe de la position',
      'inclusive_taxes': 'Taxes incluses',
      'invoice_tax_rates': 'Taux de taxe de la facture',
      'item_tax_rates': 'Taux de taxe de la position',
      'no_client_selected': 'Veuillez sélectionner un client',
      'configure_rates': 'Configurer les taux',
      'configure_gateways': 'Configurer les passerelles',
      'tax_settings': 'Réglages des taxes',
      'tax_settings_rates': 'Taux de taxes',
      'accent_color': 'Couleur de mise en évidence',
      'switch': 'Commutateur',
      'comma_sparated_list': 'Liste séparée par des virgules',
      'options': 'Options',
      'single_line_text': 'Texte sur une ligne',
      'multi_line_text': 'Texte multi-lignes',
      'dropdown': 'Liste déroulante',
      'field_type': 'Type du champ',
      'recover_password_email_sent':
          'Un courriel de récupération du mot de passe a été envoyé',
      'submit': 'Envoyer',
      'recover_password': 'Récupérer votre mot de passe',
      'late_fees': 'Frais de retard',
      'credit_number': 'Numéro d\'avoir',
      'payment_number': 'Numéro de paiement',
      'late_fee_amount': 'Montant de pénalité de retard',
      'late_fee_percent': 'Pourcentage de pénalité de retard',
      'before_due_date': 'Avant la date d\'échéance',
      'after_due_date': 'Après la date d\'échéance',
      'after_invoice_date': 'Après la date de facturation',
      'days': 'Jours',
      'invoice_email': 'E-mail de facture',
      'payment_email': 'E-mail de paiement',
      'partial_payment': 'Paiement partiel',
      'payment_partial': 'Paiement partiel',
      'partial_payment_email': 'Mail de paiement partiel',
      'quote_email': 'E-mail de devis',
      'endless_reminder': 'Rappel sans fin',
      'filtered_by_user': 'Filtré par utilisateur',
      'administrator': 'Administrateur',
      'administrator_help':
          'Permettre à l\'utilisateur de gérer les utilisateurs, modifier les paramètres et de modifier tous les enregistrements',
      'user_management': 'Gestion des utilisateurs',
      'users': 'Utilisateurs',
      'new_user': 'Nouvel utilisateur',
      'edit_user': 'Éditer l\'utilisateur',
      'created_user': 'Utilisateur créé avec succès avec succès',
      'updated_user': 'Utilisateur mis à jour avec succès',
      'archived_user': 'Utilisateur archivé avec succès',
      'deleted_user': 'Utilisateur supprimé avec succès',
      'removed_user': 'L\'utilisateur a été supprimé',
      'restored_user': 'Commande restaurée avec succès',
      'archived_users': 'Les :value utilisateurs ont été archivés avec succès',
      'deleted_users': 'Suppression réussie :value d\'utilisateurs',
      'removed_users': 'Suppression réussie :value d\'utilisateurs',
      'restored_users': 'Restauration réussie :value utilisateurs',
      'general_settings': 'Paramètres généraux',
      'invoice_options': 'Options de facturation',
      'hide_paid_to_date': 'Masquer \'Payé à ce jour\'',
      'hide_paid_to_date_help':
          'Afficher la ligne \'Payé à ce jour\' sur vos factures seulement une fois qu\'un paiement a été reçu.',
      'invoice_embed_documents': 'Intégrer des images/documents',
      'invoice_embed_documents_help':
          'Inclure les images/PDF joints à la facture.',
      'all_pages_header': 'Voir les en-têtes sur',
      'all_pages_footer': 'Voir les pieds de page sur',
      'first_page': 'Première page',
      'all_pages': 'Toutes les pages',
      'last_page': 'Dernière page',
      'primary_font': 'Police principale',
      'secondary_font': 'Police secondaire',
      'primary_color': 'Couleur principale',
      'secondary_color': 'Couleur secondaire',
      'page_size': 'Taille de Page',
      'font_size': 'Taille de police',
      'quote_design': 'Modèle des devis',
      'invoice_fields': 'Champs de facture',
      'product_fields': 'Champs de produit',
      'invoice_terms': 'Conditions de facturation',
      'invoice_footer': 'Pied de facture',
      'quote_terms': 'Conditions des devis',
      'quote_footer': 'Pied de page des devis',
      'auto_email_invoice': 'Envoyer automatiquement par courriel',
      'auto_email_invoice_help':
          'Envoyer automatiquement par courriel les factures récurrentes lorsqu\'elles sont créés.',
      'auto_archive_quote': 'Archiver automatiquement',
      'auto_archive_quote_help':
          'Archiver automatiquement les devis lorsqu\'ils sont convertis en factures',
      'auto_convert_quote': 'Convertir automatiquement',
      'auto_convert_quote_help':
          'Convertir automatiquement un devis en facture dès qu\'il est approuvé par le client.',
      'workflow_settings': 'Paramètres de flux de travail',
      'freq_daily': 'Quotidien',
      'freq_weekly': 'Hebdomadaire',
      'freq_two_weeks': 'Deux semaines',
      'freq_four_weeks': 'Quatre semaines',
      'freq_monthly': 'Mensuel',
      'freq_two_months': 'Deux mois',
      'freq_three_months': 'Trimestrielle',
      'freq_four_months': 'Quatre mois',
      'freq_six_months': 'Six mois',
      'freq_annually': 'Annuelle',
      'freq_two_years': 'Deux ans',
      'freq_three_years': 'Trois ans',
      'never': 'Jamais',
      'company': 'Entreprise',
      'generated_numbers': 'Numéros générés',
      'charge_taxes': 'Taxe supplémentaire',
      'next_reset': 'Prochaine remise à zéro',
      'reset_counter': 'Remettre le compteur à zéro',
      'recurring_prefix': 'Préfixe récurrent',
      'number_padding': 'Marge interne du numéro',
      'general': 'Général',
      'surcharge_field': 'Champ Surcharge',
      'company_field': 'Champ d\'entreprise',
      'company_value': 'Valeur de compagnie',
      'credit_field': 'Champ de Crédit',
      'invoice_field': 'Champ de facture',
      'invoice_surcharge': 'Majoration de facture',
      'client_field': 'Champ de client',
      'product_field': 'Champ de produit',
      'payment_field': 'Champ de Paiement',
      'contact_field': 'Champ de contact',
      'vendor_field': 'Champ de fournisseur',
      'expense_field': 'Champ de dépense',
      'project_field': 'Champ de projet',
      'task_field': 'Champ de tâche',
      'group_field': 'Champ de Groupe',
      'number_counter': 'Avancement du compteur',
      'prefix': 'Préfixe',
      'number_pattern': 'Modèle de numéro',
      'messages': 'Messages',
      'custom_css': 'CSS personnalisé',
      'custom_javascript': 'JavaScript personnalisé',
      'signature_on_pdf': 'Afficher sur le PDF',
      'signature_on_pdf_help':
          'Afficher la signature du client sur la facture / le devis PDF.',
      'show_accept_invoice_terms':
          'Case à cocher pour les conditions de facturation',
      'show_accept_invoice_terms_help':
          'Exiger que le client confirme qu\'il accepte les conditions de facturation',
      'show_accept_quote_terms': 'Case à cocher pour les conditions d\'offre',
      'show_accept_quote_terms_help':
          'Exiger que le client confirme qu\'il accepte les conditions de l\'offre',
      'require_invoice_signature': 'Signature de facture',
      'require_invoice_signature_help': 'Exiger que le client signe',
      'require_quote_signature': 'Signature de l\'offre',
      'enable_portal_password': 'Protéger les factures avec un mot de passe',
      'enable_portal_password_help':
          'Autoriser la création d\'un mot de passe pour chaque contact. Si un mot de passe est créé, le contact devra entrer un mot de passe avant de voir les factures.',
      'authorization': 'Autorisation',
      'subdomain': 'Sous-domaine',
      'domain': 'Domaine',
      'portal_mode': 'Mode portail',
      'email_signature': 'Cordialement,',
      'enable_email_markup_help':
          'Rendez le règlement de vos clients plus facile en ajoutant les markup schema.org à vos courriels.',
      'plain': 'Brut',
      'light': 'Clair',
      'dark': 'Sombre',
      'email_design': 'Modèle de courriel',
      'attach_pdf': 'Joindre un PDF',
      'attach_documents': 'Joindre des documents',
      'attach_ubl': 'Joindre une facture UBL/E',
      'email_style': 'Style d\'email',
      'enable_email_markup': 'Activer le balisage',
      'reply_to_email': 'Adresse de réponse',
      'reply_to_name': 'Nom de réponse',
      'bcc_email': 'Courriel CCI',
      'processed': 'Traité',
      'credit_card': 'Carte de Crédit',
      'bank_transfer': 'Virement bancaire',
      'priority': 'Prioritée',
      'fee_amount': 'Montant des frais',
      'fee_percent': 'Pourcentage des frais',
      'fee_cap': 'Limite des frais',
      'limits_and_fees': 'Limites/Frais',
      'enable_min': 'Activer min',
      'enable_max': 'Activer max',
      'min_limit': 'Min: :min',
      'max_limit': 'Max: :max',
      'min': 'Min',
      'max': 'Max',
      'accepted_card_logos': 'Logos des cartes acceptées',
      'credentials': 'Identifiants',
      'update_address': 'Mettre à jour l\'adresse',
      'update_address_help':
          'Mettre à jour l\'adresse du client avec les détails fournis',
      'rate': 'Taux',
      'tax_rate': 'Taux de taxe',
      'new_tax_rate': 'Nouveau taux de taxe',
      'edit_tax_rate': 'Éditer le taux de taxe',
      'created_tax_rate': 'Taux de taxe créé avec succès',
      'updated_tax_rate': 'Taux de taxe mis à jour avec succès',
      'archived_tax_rate': 'Taux de taxe archivé avec succès',
      'deleted_tax_rate': 'Le taux de taxe a été supprimé avec succès',
      'restored_tax_rate': 'Le taux de taxe a été restauré avec succès',
      'archived_tax_rates':
          'Les :value taux de taxes ont été archivés avec succès',
      'deleted_tax_rates':
          'Les :value taux de taxes ont été supprimés avec succès',
      'restored_tax_rates':
          'Les :value taux de taxes ont été restaurés avec succès',
      'fill_products': 'Remplissage auto des produits',
      'fill_products_help':
          'La sélection d’un produit entrainera la MAJ de la description et du prix',
      'update_products': 'Mise à jour auto des produits',
      'update_products_help':
          'La mise à jour d\'une facture entraîne la mise à jour des produits',
      'convert_products': 'Convertir les produits',
      'convert_products_help':
          'Convertir automatiquement les prix des produits dans la devise du client',
      'fees': 'Frais',
      'limits': 'Limites',
      'provider': 'Fournisseur',
      'company_gateway': 'Passerelle de paiement',
      'company_gateways': 'Passerelles de paiements',
      'new_company_gateway': 'Nouvelle passerelle',
      'edit_company_gateway': 'Éditer la passerelle',
      'created_company_gateway': 'La passerelle a été créée avec succès',
      'updated_company_gateway': 'La passerelle a été mise à jour avec succès',
      'archived_company_gateway': 'La passerelle a été archivée avec succès',
      'deleted_company_gateway': 'La passerelle a été supprimée avec succès',
      'restored_company_gateway': 'La passerelle a été restaurée avec succès',
      'archived_company_gateways':
          'Les :value passerelles ont été archivées avec succès',
      'deleted_company_gateways':
          'Les :value passerelles ont été supprimées avec succès',
      'restored_company_gateways':
          'Les :value passerelles ont été restaurées avec succès',
      'continue_editing': 'Continuer l\'édition',
      'discard_changes': 'Ignorer les modifications',
      'default_value': 'Valeur Par Défaut',
      'disabled': 'Désactivé',
      'currency_format': 'Format de devise',
      'first_day_of_the_week': 'Premier Jour de la Semaine',
      'first_month_of_the_year': 'Premier mois de l\'année',
      'sunday': 'Dimanche',
      'monday': 'Lundi',
      'tuesday': 'Mardi',
      'wednesday': 'Mercredi',
      'thursday': 'Jeudi',
      'friday': 'Vendredi',
      'saturday': 'Samedi',
      'january': 'Janvier',
      'february': 'Février',
      'march': 'Mars',
      'april': 'Avril',
      'may': 'Mai',
      'june': 'Juin',
      'july': 'Juillet',
      'august': 'Août',
      'september': 'Septembre',
      'october': 'Octobre',
      'november': 'Novembre',
      'december': 'Décembre',
      'symbol': 'Symbole',
      'ocde': 'Code',
      'date_format': 'Format de la date',
      'datetime_format': 'Format date/heure',
      'military_time': '24H',
      'military_time_help': 'Affichage sur 24h',
      'send_reminders': 'Envoyer des rappels',
      'timezone': 'Fuseau horaire',
      'filtered_by_project': 'Filtrer par projet',
      'filtered_by_group': 'Filtrer par groupe',
      'filtered_by_invoice': 'Filtré par Facture',
      'filtered_by_client': 'Filtré par Client',
      'filtered_by_vendor': 'Filtré par fournisseur',
      'group_settings': 'Paramètres de groupe',
      'group': 'Groupe',
      'groups': 'Groupes',
      'new_group': 'Nouveau Groupe',
      'edit_group': 'Éditer le groupe',
      'created_group': 'Le groupe a été créé avec succès',
      'updated_group': 'Le groupe a été mis à jour avec succès',
      'archived_groups': 'Les :value groupes ont été archivés avec succès',
      'deleted_groups': 'Les :value groupes ont été supprimés avec succès',
      'restored_groups': 'Les :value groupes ont été restaurés avec succès',
      'archived_group': 'Le groupe a été archivé avec succès',
      'deleted_group': 'Le groupe a été supprimé avec succès',
      'restored_group': 'Le groupe a été restauré avec succès',
      'upload_logo': 'Téléchargez le logo de votre entreprise',
      'uploaded_logo': 'Le logo a été envoyé avec succès',
      'logo': 'Logo',
      'saved_settings': 'Les paramètres ont été enregistrés avec succès',
      'product_settings': 'Réglages du produit',
      'device_settings': 'Paramètres de l\'appareil',
      'defaults': 'Valeurs par défaut',
      'basic_settings': 'Paramètres de base',
      'advanced_settings': 'Paramètres avancés',
      'company_details': 'Informations sur l’entreprise',
      'user_details': 'Utilisateur',
      'localization': 'Localisation',
      'online_payments': 'Paiements en ligne',
      'tax_rates': 'Taux de taxe',
      'notifications': 'Notifications',
      'import_export': 'Importer | Exporter',
      'custom_fields': 'Champs personnalisés',
      'invoice_design': 'Modèle de facture',
      'buy_now_buttons': 'Boutons Achetez maintenant',
      'email_settings': 'Paramètres d\'e-mail',
      'templates_and_reminders': 'Modèles & Rappels',
      'credit_cards_and_banks': 'Cartes de crédit et banques',
      'data_visualizations': 'Visualisation des données',
      'price': 'Prix',
      'email_sign_up': 'Inscription par email',
      'google_sign_up': 'Inscription avec Google',
      'thank_you_for_your_purchase': 'Merci pour votre achat !',
      'redeem': 'Rembourser',
      'back': 'Retour',
      'past_purchases': 'Achats antérieurs',
      'annual_subscription': 'Abonnement annuel',
      'pro_plan': 'Pro Plan',
      'enterprise_plan': 'Enterprise Plan',
      'count_users': ':count utilisateur(s)',
      'upgrade': 'Mettre à niveau',
      'please_enter_a_first_name': 'Veuillez entrer un prénom',
      'please_enter_a_last_name': 'Veuillez entrer un nom',
      'please_agree_to_terms_and_privacy':
          'Veuillez accepter les conditions d\'utilisation et la politique de confidentialité pour créer un compte.',
      'i_agree_to_the': 'J\'accepte les',
      'terms_of_service': 'Conditions d\'utilisation',
      'privacy_policy': 'Politique de confidentialité',
      'sign_up': 'S’enregistrer',
      'account_login': 'Connexion à votre compte',
      'view_website': 'Voir le site Web',
      'create_account': 'Créer un compte',
      'email_login': 'Email de connexion',
      'create_new': 'Créer',
      'no_record_selected': 'Aucun enregistrement sélectionné',
      'error_unsaved_changes':
          'Veuillez enregistrer ou annuler vos modifications',
      'download': 'Télécharger',
      'requires_an_enterprise_plan': 'Nécessite un forfait Entreprise',
      'take_picture': 'Φωτογραφίσετε',
      'upload_files': 'Télécharger des fichiers',
      'document': 'Document',
      'documents': 'Documents',
      'new_document': 'Νέο Έγγραφο',
      'edit_document': 'Εκδώσετε Έγγραφο',
      'uploaded_document': 'Le document a été envoyé avec succès',
      'updated_document': 'Document mis à jour avec succès',
      'archived_document': 'Document archivé avec succès',
      'deleted_document': 'Le document a été supprimé avec succès',
      'restored_document': 'Le document a été restauré avec succès',
      'archived_documents': 'Les :value documents ont été archivés avec succès',
      'deleted_documents': 'Les :value documents ont été supprimés avec succès',
      'restored_documents':
          'Les :value documents ont été restaurés avec succès',
      'no_history': 'Κανένα Ιστορικό',
      'expense_date': 'Date de la dépense',
      'pending': 'En attente',
      'expense_status_1': 'Σύνδεση',
      'expense_status_2': 'Σε εκκρεμότητα',
      'expense_status_3': 'Με τιμολόγιο',
      'converted': 'Converti',
      'add_documents_to_invoice': 'Ajouter des documents à la facture',
      'exchange_rate': 'Taux de change',
      'convert_currency': 'Convertir la devise',
      'mark_paid': 'Marquer comme payé',
      'category': 'Catégorie',
      'address': 'Adresse',
      'new_vendor': 'Nouveau fournisseur',
      'created_vendor': 'Fournisseur créé avec succès',
      'updated_vendor': 'Founisseur mis à jour avec succès',
      'archived_vendor': 'Fournisseur archivé avec succès',
      'deleted_vendor': 'Fournisseur supprimé avec succès',
      'restored_vendor': 'Fournisseur restauré avec succès',
      'archived_vendors': ':count fournisseurs archivés avec succès',
      'deleted_vendors': ':count fournisseurs supprimés avec succès',
      'restored_vendors':
          'Les :value fournisseurs ont été restaurés avec succès',
      'new_expense': 'Saisir une dépense',
      'created_expense': 'Dépense créée avec succès',
      'updated_expense': 'Dépense mise à jour avec succès',
      'archived_expense': 'Dépense archivée avec succès',
      'deleted_expense': 'Dépense supprimée avec succès',
      'restored_expense': 'Dépense restaurée avec succès',
      'archived_expenses': 'Dépenses archivées avec succès',
      'deleted_expenses': 'Dépenses supprimées avec succès',
      'restored_expenses': 'Les :value dépenses ont été restaurées avec succès',
      'copy_shipping': 'Copier expédition',
      'copy_billing': 'Copier facturation',
      'design': 'Design',
      'failed_to_find_record': 'Élément non trouvé',
      'invoiced': 'Facturé',
      'logged': 'Enregistré',
      'running': 'En cours',
      'resume': 'Reprendre',
      'task_errors': 'Merci de corriger les horaires conflictuels',
      'start': 'Début',
      'stop': 'Fin',
      'started_task': 'Tâche démarrée avec succès',
      'stopped_task': 'Tâche stoppée avec succès',
      'resumed_task': 'Tâche relancée avec succès',
      'now': 'Maintenant',
      'auto_start_tasks': 'Démarrer automatiquement les tâches',
      'timer': 'Compteur',
      'manual': 'Manuel',
      'budgeted': 'Budgétisé',
      'start_time': 'Début',
      'end_time': 'Heure de fin',
      'date': 'Date',
      'times': 'Horaires',
      'duration': 'Durée',
      'new_task': 'Nouvelle tâche',
      'created_task': 'Tâche créée avec succès',
      'updated_task': 'Tâche mise à jour avec succès',
      'archived_task': 'Tâche archivée avec succès',
      'deleted_task': 'Tâche supprimée avec succès',
      'restored_task': 'Tâche restaurée avec succès',
      'archived_tasks': ':count tâches archivées avec succès',
      'deleted_tasks': ':count tâches supprimées avec succès',
      'restored_tasks':
          'Les :value interventions ont été restaurées avec succès',
      'please_enter_a_name': 'Veuillez entrer un nom',
      'budgeted_hours': 'Heures budgétées',
      'created_project': 'Le projet a été créé avec succès',
      'updated_project': 'Le projet a été mis à  jour avec succès',
      'archived_project': 'Le projet a été archivé avec succès',
      'deleted_project': 'Le projet a été supprimé avec succès',
      'restored_project': 'Le projet a été rétabli avec succès',
      'archived_projects': ':count projet(s) a (ont) été archivé(s)',
      'deleted_projects':
          ':count projet(s) a (ont) été supprimé(s) avec succès',
      'restored_projects': 'Les :value projets ont été restaurés avec succès',
      'new_project': 'Nouveau projet',
      'thank_you_for_using_our_app': 'Merci d\'utiliser notre app !',
      'if_you_like_it': 'Si vous appréciez, merci de',
      'click_here': 'cliquer ici',
      'click_here_capital': 'Cliquer ici',
      'to_rate_it': 'pour évaluer notre app.',
      'average': 'Moyenne',
      'unapproved': 'Non approuvé',
      'authenticate_to_change_setting':
          'Veuillez vous connecter pour changer ce paramètre',
      'locked': 'Verrouillé',
      'authenticate': 'Connexion',
      'please_authenticate': 'Veuillez vous connecter',
      'biometric_authentication': 'Connexion biométrique',
      'footer': 'Pied de page',
      'compare': 'Comparer',
      'hosted_login': 'Authentification Hosted',
      'selfhost_login': 'Authentification Selfhost',
      'google_sign_in': 'Connexion avec Google',
      'today': 'Aujourd\'hui',
      'custom_range': 'Intervalle personnalisé',
      'date_range': 'Intervalle de dates',
      'current': 'Actuel',
      'previous': 'Précédent',
      'current_period': 'Période actuelle',
      'comparison_period': 'Comparaison de période',
      'previous_period': 'Période précédente',
      'previous_year': 'Année précédente',
      'compare_to': 'Comparer à',
      'last7_days': '7 derniers jours',
      'last_week': 'Semaine dernière',
      'last30_days': '30 derniers jours',
      'this_month': 'Mois en cours',
      'last_month': 'Mois dernier',
      'this_year': 'Cette année',
      'last_year': 'Dernière année',
      'all_time': 'Tout le temps',
      'custom': 'Personnalisé',
      'clone_to_invoice': 'Dupliquer la facture',
      'clone_to_quote': 'Dupliquer en devis',
      'clone_to_credit': 'Cloner en crédit',
      'view_invoice': 'Voir la facture',
      'convert': 'Convertir',
      'more': 'Plus',
      'edit_client': 'Modifier ce client',
      'edit_product': 'Éditer ce produit',
      'edit_invoice': 'Modifier la facture',
      'edit_quote': 'Éditer ce devis',
      'edit_payment': 'Éditer le paiement',
      'edit_task': 'Éditer la tâche',
      'edit_expense': 'Éditer la dépensee',
      'edit_vendor': 'Éditer le fournisseur',
      'edit_project': 'Editer le projet',
      'edit_recurring_quote': 'Editer devis récurrent',
      'billing_address': 'Adresse de facturation',
      'shipping_address': 'Adresse de Livraison',
      'total_revenue': 'Revenu total',
      'average_invoice': 'Facture moyenne',
      'outstanding': 'Impayé',
      'invoices_sent': ':count factures envoyées',
      'active_clients': 'clients actifs',
      'close': 'Fermer',
      'email': 'E-mail',
      'password': 'Mot de passe',
      'url': 'URL',
      'secret': 'Clé secrète',
      'name': 'Nom',
      'logout': 'Se déconnecter',
      'login': 'Connexion',
      'filter': 'Filtrer',
      'sort': 'Trier',
      'search': 'Rechercher',
      'active': 'Actif',
      'archived': 'Archivé',
      'deleted': 'Supprimé',
      'dashboard': 'Tableau de bord',
      'archive': 'Archiver',
      'delete': 'Supprimer',
      'restore': 'Restaurer',
      'refresh_complete': 'Rafraichissement terminé',
      'please_enter_your_email': 'Entrez votre adresse e-mail',
      'please_enter_your_password': 'Entez votre mot de passe',
      'please_enter_your_url': 'Entrez votre URL',
      'please_enter_a_product_key': 'Entrez la clé produit',
      'ascending': 'Ascendant',
      'descending': 'Descendant',
      'save': 'Sauvegarder',
      'an_error_occurred': 'Une erreur s\'est produite',
      'paid_to_date': 'Payé à ce jour',
      'balance_due': 'Montant dû',
      'balance': 'Solde',
      'overview': 'Vue d\'ensemble',
      'details': 'Détails',
      'phone': 'Téléphone',
      'website': 'Site web',
      'vat_number': 'Numéro de TVA',
      'id_number': 'Numéro ID',
      'create': 'Créer',
      'copied_to_clipboard': ':value a été copié au presse-papier',
      'error': 'Erreur',
      'could_not_launch': 'Lancement impossible',
      'contacts': 'Informations de contact',
      'additional': 'Additionnel',
      'first_name': 'Prénom',
      'last_name': 'Nom',
      'add_contact': 'Ajouter un contact',
      'are_you_sure': 'Voulez-vous vraiment effectuer cette action ?',
      'cancel': 'Annuler',
      'ok': 'Ok',
      'remove': 'Supprimer',
      'email_is_invalid': 'L\'adresse de courriel n\'est pas correcte',
      'product': 'Produit',
      'products': 'Produits',
      'new_product': 'Nouvel article',
      'created_product': 'Produit créé avec succès',
      'updated_product': 'Produit mis à jour avec succès',
      'archived_product': 'Produit archivé avec succès',
      'deleted_product': 'Le produit a été supprimé avec succès',
      'restored_product': 'Le produit a été rétabli avec succès',
      'archived_products': ':count produits archivés avec succès',
      'deleted_products': ':count produit(s) supprimé(s) avec succès',
      'restored_products': 'Les :value produits ont été restaurés avec succès',
      'product_key': 'Produit',
      'notes': 'Notes',
      'cost': 'Coût',
      'client': 'Client',
      'clients': 'Clients',
      'new_client': 'Nouveau client',
      'created_client': 'Client créé avec succès',
      'updated_client': 'Client modifié avec succès',
      'archived_client': 'Client archivé avec succès',
      'archived_clients': ':count clients archivés avec succès',
      'deleted_client': 'Client supprimé avec succès',
      'deleted_clients': ':count clients supprimés avec succès',
      'restored_client': 'Client restauré avec succès',
      'restored_clients': 'Les :value clients ont été restaurés avec succès',
      'address1': 'Rue',
      'address2': 'Appt/Bâtiment',
      'city': 'Ville',
      'state': 'Région/Département',
      'postal_code': 'Code postal',
      'country': 'Pays',
      'invoice': 'Facture',
      'invoices': 'Factures',
      'new_invoice': 'Nouvelle facture',
      'created_invoice': 'Facture créée avec succès',
      'updated_invoice': 'Facture modifiée avec succès',
      'archived_invoice': 'Facture archivée avec succès',
      'deleted_invoice': 'Facture supprimée avec succès',
      'restored_invoice': 'Facture restaurée avec succès',
      'archived_invoices': ':count factures archivées avec succès',
      'deleted_invoices': ':count factures supprimées avec succès',
      'restored_invoices': 'Restauration réussie :value des factures',
      'emailed_invoice': 'Facture envoyée par e-mail avec succès',
      'emailed_payment': 'Paiement envoyé par email avec succès',
      'amount': 'Montant',
      'invoice_number': 'Numéro de facture',
      'invoice_date': 'Date de la facture',
      'discount': 'Remise',
      'po_number': 'N° de Bon de Commande',
      'terms': 'Conditions',
      'public_notes': 'Note publique',
      'private_notes': 'Notes privées',
      'frequency': 'Fréquence',
      'start_date': 'Date de début',
      'end_date': 'Date de fin',
      'quote_number': 'Devis numéro',
      'quote_date': 'Date du devis',
      'valid_until': 'Valide jusqu\'au',
      'items': 'Articles',
      'partial_deposit': 'Acompte',
      'description': 'Description',
      'unit_cost': 'Coût unitaire',
      'quantity': 'Quantité',
      'add_item': 'Ajouter Article',
      'contact': 'Contact',
      'work_phone': 'Téléphone',
      'total_amount': 'Montant Total',
      'pdf': 'Fichier PDF',
      'due_date': 'Date d\'échéance',
      'partial_due_date': 'Paiement partiel',
      'paid_date': 'La date de paiement',
      'status': 'Statut',
      'invoice_status_id': 'Etat de Facture',
      'quote_status': 'État du devis',
      'click_plus_to_add_item': 'Cliquer pour ajouter un article (objet)',
      'click_plus_to_add_time': 'Cliquez sur + pour ajouter du temps',
      'count_selected': 'nombre selectionne',
      'total': 'Total',
      'percent': 'Pourcent',
      'edit': 'Éditer',
      'dismiss': 'Quitter',
      'please_select_a_date': 'Sélectionnez une date',
      'please_select_a_client': 'Sélectionnez un client',
      'please_select_an_invoice': 'Sélectionnez une facture',
      'task_rate': 'Taux de tâche',
      'settings': 'Paramètres',
      'language': 'Langue',
      'currency': 'Devise',
      'created_at': 'Date de création',
      'created_on': 'Créé le',
      'updated_at': 'Mis à jour',
      'tax': 'Taxe',
      'please_enter_an_invoice_number': 'Sélectionnez un numéro de facture',
      'please_enter_a_quote_number': 'Sélectionner un numéro de devis',
      'past_due': 'En retard',
      'draft': 'Brouillon',
      'sent': 'Envoyé',
      'viewed': 'Vu',
      'approved': 'Approuvé',
      'partial': 'Acompte',
      'paid': 'Payé',
      'mark_sent': 'Marquer comme envoyé',
      'marked_invoice_as_sent': 'Facture marquee comme envoyee avec succes',
      'marked_invoice_as_paid': 'Facture marquée avec succès comme payée',
      'marked_invoices_as_sent': 'Les factures ont été marquées envoyées',
      'marked_invoices_as_paid': 'Factures marquées avec succès comme payées',
      'done': 'Terminé',
      'please_enter_a_client_or_contact_name':
          'Veuillez introduire un nom de client',
      'dark_mode': 'Mode sombre',
      'restart_app_to_apply_change':
          'Recommencer k\'app pour introduire l\'app change',
      'refresh_data': 'Rafraîchir les données',
      'blank_contact': 'Details pour contacter la Banque',
      'activity': 'Activité',
      'no_records_found': 'Pas d\'archives trouves',
      'clone': 'Dupliquer',
      'loading': 'Chargement',
      'industry': 'Champ',
      'size': 'Taille',
      'payment_terms': 'Conditions de paiement',
      'payment_date': 'Date du paiement',
      'payment_status': 'État du paiement',
      'payment_status_1': 'En attente',
      'payment_status_2': 'Annulé',
      'payment_status_3': 'Échoué',
      'payment_status_4': 'Complété',
      'payment_status_5': 'Partiellement remboursé',
      'payment_status_6': 'Remboursement',
      'payment_status_-1': 'Non appliqué',
      'payment_status_-2': 'Partiellement non appliqué',
      'net': 'Net',
      'client_portal': 'Portail client',
      'show_tasks': 'Afficher des taches',
      'email_reminders': 'Messages de rappel par courriel',
      'enabled': 'Activé',
      'recipients': 'Destinataires',
      'initial_email': 'Courriel initial',
      'first_reminder': 'Premier rappel',
      'second_reminder': 'Second rappel',
      'third_reminder': 'Troisième rappel',
      'reminder1': 'Premier Message de Rappel',
      'reminder2': 'Deuxieme Message de Rappel',
      'reminder3': 'Troisieme Message de Rappel',
      'template': 'Modèle',
      'send': 'Envoyer',
      'subject': 'Sujet',
      'body': 'Corps',
      'send_email': 'Envoyer l\'e-mail',
      'email_receipt': 'Envoyer le reçu par e-mail au client',
      'auto_billing': 'Debit Automatique',
      'button': 'Bouton',
      'preview': 'Prévisualisation',
      'customize': 'Personnaliser',
      'history': 'Historique',
      'payment': 'Paiement',
      'payments': 'Paiements',
      'refunded': 'Remboursé',
      'payment_type': 'Type de paiement',
      'transaction_reference': 'Référence transaction',
      'enter_payment': 'Saisissez un paiement',
      'new_payment': 'Entrer un paiement',
      'created_payment': 'Paiement créé avec succès',
      'updated_payment': 'Paiement mis à jour avec succès',
      'archived_payment': 'Paiement archivé avec succès',
      'deleted_payment': 'Paiement supprimé avec succès',
      'restored_payment': 'Paiement restauré avec succès',
      'archived_payments': ':count paiement archivés avec succès',
      'deleted_payments': ':count paiements supprimés avec succès',
      'restored_payments': 'Les :value paiements ont été restaurés avec succès',
      'quote': 'Devis',
      'quotes': 'Devis',
      'new_quote': 'Nouveau devis',
      'created_quote': 'Devis créé avec succès',
      'updated_quote': 'Devis mis à jour avec succès',
      'archived_quote': 'Devis archivé avec succès',
      'deleted_quote': 'Devis supprimé avec succès',
      'restored_quote': 'Devis restauré avec succès',
      'archived_quotes': ':count devis archivés avec succès',
      'deleted_quotes': ':count devis supprimés avec succès',
      'restored_quotes': 'Les :value devis ont été restaurés avec succès',
      'expense': 'Dépense',
      'expenses': 'Dépenses',
      'vendor': 'Fournisseur',
      'vendors': 'Fournisseurs',
      'task': 'Tâche',
      'tasks': 'Tâches',
      'project': 'Projet',
      'projects': 'Projets',
      'activity_1': ':user a créé le client :client',
      'activity_2': ':user a archivé le client :client',
      'activity_3': ':user a supprimé le client :client',
      'activity_4': ':user a créé la facture :invoice',
      'activity_5': ':user a mis à jour la facture :invoice',
      'activity_6': ':user a mailé la facture :invoice pour :client à :contact',
      'activity_7': ':contact a vu la facture :invoice pour :client',
      'activity_8': ':user a archivé la facture :invoice',
      'activity_9': ':user a supprimé la facture :invoice',
      'activity_10':
          ':user a saisi le paiement :payment pour :payment _montant sur la facture :invoice pour :client',
      'activity_11': ':user a mis à jour le moyen de paiement :payment',
      'activity_12': ':user a archivé le moyen de paiement :payment',
      'activity_13': ':user a supprimé le moyen de paiement :payment',
      'activity_14': ':user a entré le crédit :credit',
      'activity_15': ':user a mis à jour le crédit :credit',
      'activity_16': ':user a archivé le crédit :credit',
      'activity_17': ':user a supprimé le crédit :credit',
      'activity_18': ':user a créé le devis :quote',
      'activity_19': ':user a mis à jour le devis :quote',
      'activity_20': ':user a mailé un devis :quote pour :client à :contact',
      'activity_21': ':contact a lu le devis :quote',
      'activity_22': ':user a archivé le devis :quote',
      'activity_23': ':user a supprimé le devis :quote',
      'activity_24': ':user a restauré le devis :quote',
      'activity_25': ':user a restauré la facture :invoice',
      'activity_26': ':user a restauré le client :client',
      'activity_27': ':user a restauré le paiement :payment',
      'activity_28': ':user a restauré le crédit :credit',
      'activity_29': ':contact a approuvé le devis :quote pour :client',
      'activity_30': ':user a créé le fournisseur :vendor',
      'activity_31': ':user a archivé le fournisseur :vendor',
      'activity_32': ':user a supprimé le fournisseur :vendor',
      'activity_33': ':user a restauré le fournisseur :vendor',
      'activity_34': ':user a créé la dépense :expense',
      'activity_35': ':user a archivé la dépense :expense',
      'activity_36': ':user a supprimé la dépense :expense',
      'activity_37': ':user a restauré la dépense :expense',
      'activity_39': ':user a annulé un paiement de :payment_amount (:payment)',
      'activity_40':
          ':user a remboursé :adjustment d\'un paiement de :payment_amount (:payment)',
      'activity_41': 'Le paiement de :payment_amount a échoué (:payment)',
      'activity_42': ':user a créé la tâche :task',
      'activity_43': ':user a mis à jour la tâche :task',
      'activity_44': ':user a archivé la tâche :task',
      'activity_45': ':user a supprimé la tâche :task',
      'activity_46': ':user a restauré la tâche :task',
      'activity_47': ':user a mis à jour la dépense :expense',
      'activity_48': ':user a créé l\'utilisateur :user',
      'activity_49': ':user a mis à jour l\'utilisateur :user',
      'activity_50': ':user a archivé l\'utilisateur :user',
      'activity_51': ':user a supprimé l\'utilisateur :user',
      'activity_52': ':user a restauré l\'utilisateur :user',
      'activity_53': ':user a marqué la facture :invoice comme envoyée',
      'activity_54': ':user a payé la facture :invoice',
      'activity_55': ':contact a répondu au ticket :ticket',
      'activity_56': ':user a visualisé le ticket :ticket',
      'activity_57': 'La facture :invoice n\'a pu être envoyée',
      'activity_58': ':user a inversé la facture :invoice',
      'activity_59': ':user a annulé la facture :invoice',
      'activity_60': ':contact a lu le devis :quote',
      'activity_61': ':user a mis à jour le client :client',
      'activity_62': ':user a mis à jour le fournisseur :vendor',
      'activity_63':
          ':user a envoyé le premier rappel pour la facture :invoice de :contact',
      'activity_64':
          ':user a envoyé le deuxième rappel pour la facture :invoice de :contact',
      'activity_65':
          ':user a envoyé le troisième rappel pour la facture :invoice de :contact',
      'activity_66':
          ':user a envoyé un rappel sans fin pour la facture :invoice de :contact',
      'activity_80': ':user a créé l\'abonnement :subscription',
      'activity_81': ':user a mis à jour l\'abonnement :subscription',
      'activity_82': ':user a archivé l\'abonnement :subscription',
      'activity_83': ':user a supprimé l\'abonnement :subscription',
      'activity_84': ':user a restauré l\'abonnement :subscription',
      'one_time_password': 'Mot de passe à usage unique',
      'emailed_quote': 'Devis envoyé par e-mail avec succès',
      'emailed_credit': 'Le crédit a envoyé par mail avec succès',
      'marked_quote_as_sent': 'Le devis sélectionné a été envoyé avec succès',
      'marked_credit_as_sent': 'Le crédit a bien été marqué comme envoyé',
      'expired': 'Expiré',
      'all': 'Tous',
      'select': 'Sélectionner',
      'long_press_multiselect': 'Multisélection par pression longue',
      'custom_value1': 'Valeur personnalisée 1',
      'custom_value2': 'Valeur personnalisée 2',
      'custom_value3': 'Valeur personnalisée 3',
      'custom_value4': 'Valeur personnalisée 4',
      'email_style_custom': 'Style de courriel personnalisé',
      'custom_message_dashboard': 'Message personnalisé du tableau de bord',
      'custom_message_unpaid_invoice':
          'Message personnalisé pour une facture impayée',
      'custom_message_paid_invoice':
          'Message personnalisé pour un paiement de facture',
      'custom_message_unapproved_quote':
          'Message personnalisé pour un devis refusé',
      'lock_invoices': 'Verrouiller les factures',
      'translations': 'Traductions',
      'task_number_pattern': 'Modèle de numéro de tâche',
      'task_number_counter': 'Modèle de compteur de tâche',
      'expense_number_pattern': 'Modèle de numéro de dépense',
      'expense_number_counter': 'Modèle de compteur de dépense',
      'vendor_number_pattern': 'Modèle de numéro de fournisseur',
      'vendor_number_counter': 'Modèle de compteur de fournisseur',
      'ticket_number_pattern': 'Modèle de numéro de ticket',
      'ticket_number_counter': 'Modèle de compteur de ticket',
      'payment_number_pattern': 'Modèle de numéro de paiement',
      'payment_number_counter': 'Modèle de compteur de paiement',
      'invoice_number_pattern': 'Modèle de numéro de facture',
      'invoice_number_counter': 'Compteur du numéro de facture',
      'quote_number_pattern': 'Modèle de numéro de devis',
      'quote_number_counter': 'Compteur du numéro de devis',
      'client_number_pattern': 'Modèle de numéro de crédit',
      'client_number_counter': 'Modèle de compteur de crédit',
      'credit_number_pattern': 'Modèle de numéro de crédit',
      'credit_number_counter': 'Modèle de compteur de crédit',
      'reset_counter_date': 'Remise à zéro du compteur de date',
      'counter_padding': 'Espacement du compteur',
      'shared_invoice_quote_counter': 'Partager le compteur de factures/devis',
      'default_tax_name_1': 'Nom par défaut de la taxe 1',
      'default_tax_rate_1': 'Taux par défaut de la taxe 1',
      'default_tax_name_2': 'Nom par défaut de la taxe 2',
      'default_tax_rate_2': 'Taux par défaut de la taxe 2',
      'default_tax_name_3': 'Nom par défaut de la taxe 3',
      'default_tax_rate_3': 'Taux par défaut de la taxe 3',
      'email_subject_invoice': 'Sujet du courriel de la facture',
      'email_subject_quote': 'Sujet du courriel du devis',
      'email_subject_payment': 'Sujet du courriel du paiement',
      'email_subject_payment_partial': 'Sujet du mail de paiement partiel',
      'show_table': 'Afficher en tableau',
      'show_list': 'Afficher en liste',
      'client_city': 'Ville du client',
      'client_state': 'Région du client',
      'client_country': 'Pays du client',
      'client_is_active': 'Le client est actif',
      'client_balance': 'Solde du client',
      'client_address1': 'Adresse du client',
      'client_address2': 'App / bureau du client',
      'vendor_address1': 'Rue du fournisseur',
      'vendor_address2': 'Appt/Bâtiment du fournisseur',
      'client_shipping_address1': 'Adresse de livraison du client',
      'client_shipping_address2': 'App / Bureau de livraison du client',
      'type': 'Type',
      'invoice_amount': 'Montant de la facture',
      'invoice_due_date': 'Date limite',
      'tax_rate1': 'Taux de taxe 1',
      'tax_rate2': 'Taux de taxe 2',
      'tax_rate3': 'Taux de taxe 3',
      'auto_bill': 'Facturation automatique',
      'archived_at': 'Archivé le',
      'has_expenses': 'Dépenses en cours',
      'custom_taxes1': 'Autres taxes 1',
      'custom_taxes2': 'Autres taxes 2',
      'custom_taxes3': 'Autres taxes 3',
      'custom_taxes4': 'Autres taxes 4',
      'custom_surcharge1': 'Autre frais 1',
      'custom_surcharge2': 'Autre frais 2',
      'custom_surcharge3': 'Autre frais 3',
      'custom_surcharge4': 'Autre frais 4',
      'is_deleted': 'Supprimé',
      'vendor_city': 'Ville du fournisseur',
      'vendor_state': 'Région du fournisseur',
      'vendor_country': 'Pays du fournisseur',
      'is_approved': 'Est approuvé',
      'tax_name': 'Nom de la taxe',
      'tax_amount': 'Montant de la taxe',
      'tax_paid': 'Taxe payée',
      'payment_amount': 'Montant du paiement',
      'age': 'Ancienneté',
      'is_running': 'En cours',
      'time_log': 'Journal de temps',
      'bank_id': 'Banque',
      'expense_category_id': 'ID de catégorie de dépense',
      'expense_category': 'Catégorie de dépense',
      'invoice_currency_id': 'ID de la devise de facturation',
      'tax_name1': 'Nom de la taxe 1',
      'tax_name2': 'Nom de la taxe 2',
      'tax_name3': 'Nom de taxe 3',
      'transaction_id': 'ID de transaction',
      'status_color_theme': 'Thème de couleur de statut',
      'load_color_theme': 'Charger le thème de couleur',
    },
    'de': {
      'net_cost': 'Net Cost',
      'skip_automatic_emails': 'Skip Automatic Emails',
      'forward_email': 'Forward Email',
      'cc_only': 'Nur Kreditkarten',
      'activity_149':
          ':user hat Gutschrift :credit für :client an :contact gesendet',
      'activity_150': 'Das Konto wurde gelöscht :notes',
      'activity_154':
          'Die elektronische Rechnung :invoice für :client wurde erfolgreich an AEAT gesendet.',
      'activity_155':
          'Die elektronische Rechnung :invoice für :client konnte nicht an AEAT :notes gesendet werden.',
      'activity_156':
          'Die Stornierung der Rechnung :invoice an AEAT war erfolgreich.',
      'activity_157':
          'Die Stornierung der Rechnung :invoice konnte nicht an AEAT :notes gesendet werden.',
      'activity_158':
          'Angebot / Kostenvoranschlag :quote wurde von :client :notes abgelehnt',
      'rejected': 'Abgelehnt',
      'quote_rejected': 'Angebot / Kostenvoranschlag Abgelehnt',
      'disable_recurring_payment_notification':
          'Deaktivieren Sie die Benachrichtigung über wiederkehrende Zahlungen',
      'disable_recurring_payment_notification_help':
          'Es werden keine Benachrichtigungen über die erfolgreiche Zahlung wiederkehrender Rechnungen gesendet.',
      'e_invoice_received_notification':
          'Benachrichtigung über den Erhalt der elektronischen Rechnung',
      'e_invoice_received_notification_help':
          'Senden Sie eine E-Mail, wenn eine elektronische Rechnung eingegangen ist.',
      'empty': 'Leer',
      'location_name': 'Name des Standorts',
      'location_field': 'Standortfeld',
      'activity_151':
          'Kunde :notes wurde durch :client in :user zusammengeführt.',
      'activity_152':
          'Lieferant :notes wurde durch :vendor in :user integriert.',
      'activity_153': 'Kunde :notes wurde von :user gelöscht.',
      'secret_key': 'Geheimer Schlüssel',
      'access_key': 'Zugangsschlüssel',
      'from_address': 'Absenderadresse',
      'topic_arn': 'Thema ARN',
      'replaced': 'Ersetzt',
      'tax_names': 'Steuernamen',
      'location': 'Ort',
      'is_shipping': 'Ist Versand',
      'deleted_location': 'Standort gelöscht',
      'added_location': 'Standort erfolgreich hinzugefügt',
      'updated_location': 'Standort aktualisiert',
      'edit_location': 'Standort editieren',
      'add_location': 'Standort hinzufügen',
      'locations': 'Standorte',
      'preference_product_notes_for_html_view':
          'Verwende Artikelnotizen für die HTML-Ansicht',
      'preference_product_notes_for_html_view_help':
          'Wenn die Rechnung im HTML-Format angezeigt wird, soll die Artikelbeschreibung dem Artikeltitel vorgezogen werden.',
      'in_stock_quantity': 'Lagerbestand',
      'send_emails': 'E-Mails senden',
      'send_emails_permission': 'Benutzern das Senden von E-Mails erlauben',
      'enable_client_profile_update':
          'Ermöglichen Sie Kunden, ihr Profil zu aktualisieren',
      'enable_client_profile_update_help':
          'Ermöglichen Sie Kunden, ihre Profilinformationen über das Kunde zu aktualisieren',
      'participant': 'Teilnehmer',
      'merged_vendors': 'Erfolgreich fusionierte Anbieter',
      'activity_146':
          'E-Rechnung :invoice für :client erfolgreich zugestellt! :notes',
      'activity_147':
          'Fehlgeschlagene Zustellung der E-Rechnung :invoice für :client. :notes',
      'activity_148': 'E-Ausgabe :expense erhalten von :vendor',
      'payment_failed': 'Zahlung fehlgeschlagen',
      'activity_141': 'Benutzer :user hat folgende Notiz eingegeben: :notes',
      'activity_142': 'Erinnerung 1 für Angebot :quote',
      'activity_143':
          'Automatische Rechnungsstellung für Rechnung :invoice erfolgreich',
      'activity_144':
          'Automatische Rechnungsstellung für Rechnung :invoice fehlgeschlagen. :notes',
      'activity_145': 'E-Rechnung :invoice für :client wurde gesendet. :notes',
      'ssl_host_override': 'SSL-Host-Override',
      'upload_logo_short': 'Logo hochladen',
      'show_pdfhtml_on_mobile_help':
          'Zur besseren Visualisierung wird bei der Anzeige auf Mobilgeräten eine HTML-Version der Rechnung/des Angebots angezeigt.',
      'accept_purchase_order': 'Bestellung annehmen',
      'one_page_checkout': 'Ein-Seiten-Checkout',
      'one_page_checkout_help':
          'Aktivieren Sie den neuen Single-Page-Zahlungsablauf',
      'applies_to': 'Gilt für',
      'purchase_order_items': 'Bestellpositionen',
      'assigned_group': 'Gruppe erfolgreich zugewiesen',
      'assign_group': 'Gruppe zuweisen',
      'merge_to_pdf': 'Als PDF zusammenführen',
      'emails': 'E-Mails',
      'latest_requires_php_version':
          'Hinweis: Die neueste Version erfordert PHP :version',
      'quote_reminder1': 'Erste Angebots-Erinnerung',
      'before_valid_until': 'Vor dem gültig bis',
      'after_valid_until': 'Nach dem gültig bis',
      'after_quote_date': 'Nach dem Angebots-Datum',
      'remind_quote': 'Angebot erinnern',
      'task_assigned_notification': 'Aufgabe Zugewiesene Benachrichtigung',
      'task_assigned_notification_help':
          'E-Mail senden, wenn eine Aufgabe zugewiesen wird',
      'invoices_locked_end_of_month':
          'Rechnungen werden am Monatsende gesperrt',
      'end_of_month': 'Monatsende',
      'referral_url': 'Verweis-URL',
      'referral_program': 'Empfehlungs-Programm',
      'comment': 'Kommentar',
      'add_comment': 'Kommentar hinzufügen',
      'added_comment': 'Kommentar erfolgreich gespeichert',
      'disconnected': 'Getrennt',
      'reconnect': 'Erneut verbinden',
      'e_invoice_settings': 'E-Rechnungseinstellungen',
      'calculate': 'Berechnen',
      'sum': 'Summe',
      'money': 'Geld',
      'time': 'Zeit',
      'format': 'Format',
      'web_app': 'Webanwendung',
      'desktop_app': 'Desktopanwendung',
      'invoice_net_amount': 'Rechnungsnettobetrag',
      'round_to_seconds': 'Auf Sekunden runden',
      '1_minute': '1 Minute',
      '5_minutes': '5 Minuten',
      '15_minutes': '15 Minuten',
      '30_minutes': '30 Minuten',
      '1_hour': '1 Stunde',
      '1_day': '1 Tag',
      'round_tasks': 'Aufgabe Rundungsrichtung',
      'round_tasks_help': 'Runde Aufgabe mal rauf oder runter.',
      'direction': 'Richtung',
      'round_up': 'Aufrunden',
      'round_down': 'Abrunden',
      'task_round_to_nearest': 'Auf nächste Zahl runden',
      'activity_139': 'Ausgabe :expense Benachrichtigung an :contact gesendet',
      'activity_140': 'Erklärung gesendet an :client',
      'bulk_updated': 'Daten erfolgreich aktualisiert',
      'bulk_update': 'Massenaktualisierung',
      'advanced_cards': 'Erweiterte Karten',
      'always_show_required_fields':
          'Formular „Erforderliche Felder immer anzeigen“',
      'always_show_required_fields_help':
          'Zeigt beim Bezahlvorgang immer das Formular mit den erforderlichen Feldern an.',
      'flutter_web_warning':
          'Für eine optimale Leistung empfehlen wir die Verwendung der neuen Web-App oder der Desktop-App.',
      'rappen_rounding': 'Rappenrundung',
      'rappen_rounding_help': 'Betrag auf 5 Cent aufrunden',
      'check_credentials': 'Anmeldeinformationen prüfen',
      'valid_credentials': 'Die Anmeldeinformationen sind gültig',
      'invalid_credentials': 'Diese Zugangsdaten können wir nicht finden.',
      'e_quote': 'E-Angebot',
      'e_credit': 'E-Guthaben',
      'e_purchase_order': 'Elektronische Bestellung',
      'valid_vat_number': 'Gültige USt-IdNr.',
      'use_available_payments': 'Verwenden Sie verfügbare Zahlungen',
      'test_email_sent': 'E-Mail erfolgreich gesendet',
      'send_test_email': 'Test-E-Mail verschicken',
      'gateway_type': 'Gateway-Typ',
      'please_select_an_invoice_or_credit':
          'Bitte wählen Sie eine Rechnung oder Gutschrift aus',
      'mobile_version': 'Mobile Version',
      'venmo': 'Venmo',
      'mercado_pago': 'Mercado Pago',
      'my_bank': 'Meine Bank',
      'pay_later': 'Später Zahlen',
      'email_report': 'E-Mail-Bericht',
      'host': 'Host',
      'port': 'Port',
      'encryption': 'Verschlüsselung',
      'local_domain': 'Lokale Domäne',
      'verify_peer': 'Peer überprüfen',
      'username': 'Benutzername',
      'nordigen_help':
          'Hinweis: Für die Verbindung eines Kontos ist ein GoCardless/Nordigen-API-Schlüssel erforderlich',
      'participant_name': 'Teilnehmername',
      'yodlee_regions': 'Regionen: USA, Großbritannien, Australien und Indien',
      'nordigen_regions': 'Regionen: Europa und Großbritannien',
      'select_provider': 'Wählen Sie Anbieter aus',
      'payment_type_credit': 'Zahlungsart Gutschrift',
      'payment_type_debit': 'Zahlungsart Lastschrift',
      'send_emails_to': 'Sende E-Mails an',
      'primary_contact': 'Primärkontakt',
      'all_contacts': 'Alle Kontakte',
      'insert_below': 'Darunter einfügen',
      'ar_detailed': 'Detaillierte Debitorenbuchhaltung',
      'ar_summary': 'Zusammenfassung der Debitorenbuchhaltung',
      'client_sales': 'Kunde',
      'tax_summary': 'Steuerzusammenfassung',
      'user_sales': 'Benutzerverkäufe',
      'run_template': 'Vorlage ausführen',
      'task_extension_banner':
          'Die Chrome Erweiterung hinzufügen, um Aufgaben zu bearbeiten',
      'watch_video': 'Video ansehen',
      'view_extension': 'Erweiterung ansehen',
      'reactivate_email': 'E-Mail reaktivieren',
      'email_reactivated': 'Email erfolgreich reaktiviert',
      'template_help': 'Aktivieren Sie die Verwendung des Designs als Vorlage',
      'delivery_note_design': 'Lieferschein Design',
      'statement_design': 'Statement-Design',
      'payment_receipt_design': 'Zahlungsbeleg Design',
      'payment_refund_design': 'Gutschrift Design',
      'quarter': 'Quartal',
      'item_description': 'Artikelbeschreibung',
      'task_item': 'Aufgabe',
      'record_state': 'Aufnahmestatus',
      'last_login': 'Letzter Login',
      'save_files_to_this_folder': 'Speichern Sie Dateien in diesem Ordner',
      'downloads_folder': 'Downloads-Ordner',
      'total_invoiced_quotes': 'Angebote auf Rechnung',
      'total_invoice_paid_quotes': 'Auf Rechnung bezahlte Angebote',
      'downloads_folder_does_not_exist':
          'Der Download-Ordner existiert nicht :value',
      'user_logged_in_notification':
          'Benachrichtigung über angemeldeten Benutzer',
      'user_logged_in_notification_help':
          'Senden Sie eine E-Mail, wenn Sie sich von einem neuen Standort aus anmelden',
      'client_contact': 'Kundenkontakt',
      'expense_status_4': 'Unbezahlt',
      'expense_status_5': 'Bezahlt',
      'recurring': 'Wiederkehrend',
      'ziptax_help':
          'Hinweis: Für diese Funktion ist ein \'Zip-Tax\'-API-Schlüssel erforderlich, um die US-Umsatzsteuer anhand der Adresse zu ermitteln',
      'cache_data': 'Cache Daten',
      'unknown': 'Unbekannt',
      'webhook_failure': 'Webhook-Fehler',
      'email_opened': 'E-Mail geöffnet',
      'email_delivered': 'E-Mail zugestellt',
      'log': 'Log',
      'individual': 'Indiviuell',
      'partnership': 'Partnerschaft',
      'trust': 'Treuhand/Stiftung',
      'charity': 'Wohltätigkeitsorganisation',
      'government': 'Regierungsbehörde',
      'classification': 'Klassifizierung',
      'click_or_drop_files_here': 'Hier klicken oder Dateien ablegen',
      'public': 'Öffentlich',
      'private': 'Privat',
      'image': 'Bild',
      'other': 'Andere',
      'hash': 'Hash',
      'linked_to': 'Verknüpft mit',
      'file_saved_in_path': 'Die Datei wurde unter :path gespeichert',
      'unlinked_transactions':
          'Verknüpfung zu :count Transaktionen wurde erfolgreich entfernt',
      'unlinked_transaction':
          'Verknüpfung zu einer Transaktion wurde erfolgreich entfernt',
      'unlink': 'Trennen',
      'view_dashboard_permission':
          'Nutzern erlauben, auf das Dashboard zuzugreifen. Die Berechtigungen der Nutzer limitieren die angezeigten Daten.',
      'is_tax_exempt': 'Steuerbefreit',
      'district': 'Bezirk',
      'region': 'Region',
      'county': 'Landkreis',
      'tax_details': 'Steuerdetails',
      'activity_10_online':
          ':contact hat die Zahlung :payment für die Rechnung :invoice für :client geleistet',
      'activity_10_manual':
          ':user hat die Zahlung :payment für die Rechnung :invoice des Kunden :client eingegeben',
      'default_payment_type': 'Standard Zahlungsart',
      'admin_initiated_payments': 'Administrator-initiierte Zahlungen',
      'admin_initiated_payments_help':
          'Aktivieren von Zahlungen ohne Rechnung im Admin-Portal',
      'use_mobile_to_manage_plan':
          'Verwenden der Telefon-Abonnementeinstellungen, um Ihren Tarif zu verwalten',
      'show_task_billable': 'Abrechenbare Aufgaben anzeigen',
      'credit_item': 'Gutschriftsposition',
      'files': 'Dateien',
      'camera': 'Kamera',
      'gallery': 'Gallerie',
      'email_count_invoices': ':count Rechnungen versenden',
      'project_location': 'Feld, in dem das Projekt genannt wird',
      'invoice_task_item_description': 'Rechnungspositionsbeschreibung',
      'invoice_task_item_description_help':
          'Element-Beschreibung zu den Rechnungspositionen hinzufügen',
      'next_send_time': 'Nächster Versandzeitpunkt',
      'uploaded_certificate': 'Das Zertifikat wurde erfolgreich hochgeladen',
      'certificate_set': 'Zertifikat hochgeladen',
      'certificate_not_set': 'Zertifikat nicht hochgeladen',
      'passphrase_set': 'Passwort eingegeben',
      'passphrase_not_set': 'Passwort nicht gesetzt',
      'upload_certificate': 'Zertifikat hochladen',
      'certificate_passphrase': 'Zertifikat Passwort',
      'rename': 'Umbenennen',
      'renamed_document': 'Dokument erfolgreich umbenannt',
      'e_invoice': 'E-Rechnung',
      'light_dark_mode': 'Tag-/Nachtmodus',
      'activities': 'Aktivitäten',
      'routing_id': 'Routing-ID',
      'enable_e_invoice': 'Aktiviere E-Rechnung',
      'e_invoice_type': 'E-Rechnungsstandard',
      'e_quote_type': 'E-Angebot Typ',
      'reduced_tax': 'Reduzierte Mehrwertsteuer',
      'override_tax': 'Steuer überschreiben',
      'zero_rated': 'Steuerbefreit (Z: Zero-rated)',
      'reverse_tax': 'Innergemeinschaftliche Lieferung',
      'updated_tax_category': 'Steuerkategorie erfolgreich aktualisiert',
      'updated_tax_categories': 'Steuerkategorien erfolgreich aktualisiert',
      'set_tax_category': 'Steuerkategorie setzen',
      'payment_manual': 'Zahlungshandbuch',
      'tax_category': 'Steuerkategorie',
      'physical_goods': 'Physische Güter',
      'digital_products': 'Digitale Produkte',
      'services': 'Dienstleistungen',
      'shipping': 'Versand',
      'tax_exempt': 'Steuerbefreit (E: Exempt)',
      'reduced_rate': 'Reduzierter Preis',
      'tax_all': 'Alles besteuern',
      'tax_selected': 'Steuer ausgewählt',
      'version': 'Ausführung',
      'seller_subregion': 'Unterregion des Verkäufers',
      'calculate_taxes': 'Steuern berechnen',
      'calculate_taxes_help':
          'Archivieren Sie Angebote automatisch, wenn sie in Rechnungen umgewandelt werden.',
      'admin': 'Admin',
      'owner': 'Eigentümer',
      'link_expenses': 'Link Ausgabe',
      'converted_client_balance': 'Umgerechneter Gutschriftsbetrag',
      'converted_payment_balance': 'Konvertierter Zahlungssaldo',
      'total_hours': 'Gesamtstunden',
      'date_picker_hint':
          'Verwenden Sie +days, um das Datum in die Zukunft zu legen',
      'browser_pdf_viewer': 'Nutze den PDF-Viewer des Browsers',
      'browser_pdf_viewer_help':
          'Warnung: Verhindert die Interaktion mit der App über PDF-Datei',
      'increase_prices': 'Preise erhöhen',
      'update_prices': 'Preise aktualisieren',
      'incresed_prices':
          'Erfolgreich in die Warteschlange gestellte Preise, die erhöht werden sollen',
      'updated_prices':
          'Preise wurden erfolgreich in die Warteschlange gestellt, um aktualisiert zu werden',
      'bacs': 'BACS-Lastschrift',
      'api_token': 'API-Token',
      'api_key': 'API-Schlüssel',
      'endpoint': 'Endpunkt',
      'billable': 'Abrechenbar',
      'not_billable': 'Nicht abrechenbar',
      'allow_billable_task_items': 'Kostenpflichtige Aufgabenelemente zulassen',
      'allow_billable_task_items_help':
          'Aktivieren Sie die Konfiguration, welche Aufgabenelemente in Rechnung gestellt werden',
      'show_task_item_description': 'Aufgabenelementbeschreibung anzeigen',
      'show_task_item_description_help':
          'Aktivieren Sie die Angabe von Aufgabenelementbeschreibungen',
      'email_record': 'E-Mail-Datensatz',
      'invoice_product_columns': 'Rechnungsproduktspalten',
      'quote_product_columns': 'Produktspalten zitieren',
      'minimum_payment_amount': 'Mindestzahlungsbetrag',
      'client_initiated_payments': 'Vom Kunden initiierte Zahlungen',
      'client_initiated_payments_help':
          'Unterstützung bei der Durchführung einer Zahlung im Kundenportal ohne Rechnung',
      'share_invoice_quote_columns': 'Rechnungs-/Angebotsspalten teilen',
      'cc_email': 'CC-E-Mail',
      'payment_balance': 'Zahlungsbilanz',
      'view_report_permission':
          'Benutzern Zugriff auf die Berichte gewähren, Daten sind auf verfügbare Berechtigungen beschränkt',
      'activity_138':
          'Zahlung :payment wurde per E-Mail an den Kunden :client gesendet',
      'one_time_products': 'Einmalige Produkte',
      'optional_one_time_products': 'Optionale einmalige Produkte',
      'required': 'Erforderlich',
      'hidden': 'Versteckt',
      'payment_links': 'Zahlungslinks',
      'action': 'Aktion',
      'upgrade_to_paid_plan_to_schedule':
          'Wechsle in einen kostenpflichtigen Tarif zur Erstellung von Zeitplänen',
      'next_run': 'Nächster Durchlauf',
      'all_clients': 'Alle Kunden',
      'show_aging_table': 'Alterungstabelle anzeigen',
      'show_payments_table': 'Tabelle der Zahlungen anzeigen',
      'only_clients_with_invoices': 'Nur Kunden mir Rechnungen',
      'email_statement': 'E-Mail-Erklärung',
      'once': 'Einmal',
      'schedule': 'Zeitgesteuert',
      'schedules': 'Zeitpläne',
      'new_schedule': 'Neuer Zeitplan',
      'edit_schedule': 'Zeitplan bearbeiten',
      'created_schedule': 'Erfolgreich neuen Zeitplan erstellt',
      'updated_schedule': 'Zeitplan erfolgreich aktualisiert',
      'archived_schedule': 'Erfolgreich Zeitplan archiviert',
      'deleted_schedule': 'Zeitplan erfolgreich gelöscht',
      'removed_schedule': 'Zeitplan erfolgreich entfernt',
      'restored_schedule': 'Zeitplan erfolgreich wiederhergestellt',
      'search_schedule': 'Zeitplan suchen',
      'search_schedules': 'Suchpläne',
      'archive_payment': 'Zahlung archivieren',
      'archive_invoice': 'Rechnung archivieren',
      'archive_quote': 'Angebot archivieren',
      'archive_credit': 'Gutschrift archivieren',
      'archive_task': 'Aufgabe archivieren',
      'archive_client': 'Kunde archivieren',
      'archive_project': 'Projekt archivieren',
      'archive_expense': 'Ausgabe archivieren',
      'restore_payment': 'Zahlung wiederherstellen',
      'restore_invoice': 'Rechnung wiederherstellen',
      'restore_quote': 'Angebot wiederherstellen',
      'restore_credit': 'Gutschrift wiederherstellen',
      'restore_task': 'Aufgabe wiederherstellen',
      'restore_client': 'Kunde wiederherstellen',
      'restore_project': 'Projekt wiederherstellen',
      'restore_expense': 'Ausgabe Wiederherstellen',
      'archive_vendor': 'Lieferant archivieren',
      'restore_vendor': 'Lieferant wiederherstellen',
      'create_product': 'Produkt erstellen',
      'update_product': 'Produkt aktualisieren',
      'delete_product': 'Produkt löschen',
      'restore_product': 'Produkt wiederherstellen',
      'archive_product': 'Produkt archivieren',
      'create_purchase_order': 'Bestellung erstellen',
      'update_purchase_order': 'Bestellung aktualisieren',
      'delete_purchase_order': 'Bestellung löschen',
      'restore_purchase_order': 'Bestellung wiederherstellen',
      'archive_purchase_order': 'Bestellung archivieren',
      'sent_invoice': 'Rechnung gesendet',
      'sent_quote': 'Angebot gesendet',
      'sent_credit': 'Gutschrift gesendet',
      'sent_purchase_order': 'Bestellung gesendet',
      'image_url': 'Bild URL',
      'max_quantity': 'Maximale Menge',
      'test_url': 'Test-URL',
      'auto_bill_help_off': 'Option wird nicht angezeigt',
      'auto_bill_help_optin': 'Option wird angezeigt, aber nicht ausgewählt',
      'auto_bill_help_optout': 'Option wird angezeigt und ausgewählt',
      'auto_bill_help_always': 'Option wird nicht angezeigt',
      'payment_methods': 'Zahlungsarten',
      'view_all': 'Alle anzeigen',
      'edit_all': 'Alle bearbeiten',
      'accept_purchase_order_number': 'Bestellungsnummer akzeptieren',
      'accept_purchase_order_number_help':
          'Kunden die Möglichkeit geben, eine Bestellnummer anzugeben, wenn sie ein Angebot genehmigen',
      'from_email': 'Absender-E-Mail',
      'show_preview': 'Vorschau anzeigen',
      'show_paid_stamp': '\'Bezahlt\' Stempel anzeigen',
      'show_shipping_address': 'Lieferadresse anzeigen',
      'no_documents_to_download':
          'In den ausgewählten Datensätzen befinden sich keine Dokumente zum Herunterladen',
      'pixels': 'Pixel',
      'logo_size': 'Logogröße',
      'postal_city': 'PLZ/Stadt',
      'failed': 'Fehlgeschlagen',
      'client_contacts': 'Kundenkontakte',
      'sync_from': 'Synchronisieren von',
      'inventory_threshold': 'Inventargrenzwert',
      'hour': 'Stunde',
      'emailed_statement': 'Erfolgreich in die Versandwarteschlange eingereiht',
      'show_email_footer': 'E-Mail Fußzeile anzeigen',
      'invoice_task_hours':
          'In Aufgabe erfasste Stunden in Rechnungen ausweisen',
      'invoice_task_hours_help':
          'Zeigt die Stunden in den Rechnungspositionen an',
      'auto_bill_standard_invoices':
          'Automatische Rechnungsstellung von Standardrechnungen',
      'auto_bill_recurring_invoices':
          'Wiederkehrende Rechnungen automatisch abrechnen',
      'email_alignment': 'E-Mail Ausrichtung',
      'pdf_preview_location': 'PDF Vorschau Ort',
      'mailgun': 'Mailgun',
      'postmark': 'Postmark',
      'microsoft': 'Microsoft',
      'click_plus_to_create_record': 'Klicke + um einen Eintrag hinzuzufügen',
      'last365_days': 'Letzte 365 Tage',
      'import_design': 'Design importieren',
      'imported_design': 'Design wurde erfolgreich importiert',
      'invalid_design': 'Das Design ist ungültig, die Sekion :value is missing',
      'setup_wizard_logo': 'Möchtest Sie ein Logo hochladen?',
      'upload': 'Hochladen',
      'installed_version': 'Installierte Version',
      'notify_vendor_when_paid': 'Benachrichtige Lieferant bei Zahlung',
      'notify_vendor_when_paid_help':
          'Sende eine E-Mail an den Lieferanten wenn die Ausgabe als bezahlt markiert ist',
      'update_payment': 'Zahlung aktualisieren',
      'markup': 'Aufschlag',
      'purchase_order_created': 'Bestellung erstellt',
      'purchase_order_sent': 'Bestellung gesendet',
      'purchase_order_viewed': 'Bestellung angesehen',
      'purchase_order_accepted': 'Bestellung angenommen',
      'credit_payment_error':
          'Der Gutschriftsbetrag darf nicht größer sein als der Auszahlungsbetrag',
      'klarna': 'Klarna',
      'convert_payment_currency_help':
          'Legen Sie einen Wechselkurs fest, wenn Sie eine manuelle Zahlung eingeben',
      'convert_expense_currency_help':
          'Legen Sie beim Erstellen einer Ausgabe einen Wechselkurs fest',
      'matomo_url': 'Matomo URL',
      'matomo_id': 'Matomo ID',
      'action_add_to_invoice': 'Zur Rechnung hinzufügen',
      'online_payment_email_help':
          'Automatische E-Mail versenden, wenn eine Online-Zahlung erfolgt ist',
      'manual_payment_email_help':
          'Automatische E-Mail versenden, wenn eine Zahlung manuell bestätigt wurde',
      'mark_paid_payment_email_help':
          'Automatische E-Mail versenden, wenn eine Rechnung als bezahlt markiert wurde',
      'delete_project': 'Projekt löschen',
      'linked_transaction': 'Erfolgreich verknüpfte Transaktion',
      'link_payment': 'Link Zahlung',
      'link_expense': 'Link Ausgabe',
      'lock_invoiced_tasks': 'In Rechnung gestellte Aufgaben sperren',
      'lock_invoiced_tasks_help':
          'Verhindern, dass Aufgaben nach der Rechnungsstellung bearbeitet werden',
      'registration_required': 'Registrierung erforderlich',
      'registration_required_help': 'Kunden zur Registrierung verpflichten',
      'use_inventory_management': 'Bestandsverwaltung verwenden',
      'use_inventory_management_help': 'Produkte müssen auf Lager sein',
      'optional_products': 'Optionale Produkte',
      'optional_recurring_products': 'Optionale wiederkehrende Produkte',
      'convert_matched': 'Konvertieren',
      'auto_billed_invoice':
          'Erfolgreich in die Warteschlange gestellte Rechnung für die automatische Rechnungsstellung',
      'auto_billed_invoices':
          'Erfolgreich in die Warteschlange gestellte Rechnungen für die automatische Rechnungsstellung',
      'operator': 'Bediener',
      'value': 'Wert',
      'is': 'Ist',
      'contains': 'Enthält',
      'starts_with': 'Beginnt mit',
      'is_empty': 'Ist leer',
      'add_rule': 'Regel hinzufügen',
      'match_all_rules': 'Alle Regeln erfüllen',
      'match_all_rules_help':
          'Alle Kriterien müssen übereinstimmen, damit die Regel angewendet werden kann',
      'auto_convert_help':
          'Passende Transaktionen automatisch in Ausgaben umwandeln',
      'rules': 'Regeln',
      'transaction_rule': 'Transaktionsregel',
      'transaction_rules': 'Transaktionsregeln',
      'new_transaction_rule': 'Neue Transaktionsregel',
      'edit_transaction_rule': 'Transaktionsregel bearbeiten',
      'created_transaction_rule': 'Regel erfolgreich erstellt',
      'updated_transaction_rule': 'Transaktionsregel erfolgreich aktualisiert',
      'archived_transaction_rule': 'Transaktionsregel erfolgreich archiviert',
      'deleted_transaction_rule': 'Transaktionsregel erfolgreich gelöscht',
      'removed_transaction_rule': 'Transaktionsregel erfolgreich entfernt',
      'restored_transaction_rule':
          'Transaktionsregel  erfolgreich wiederhergestellt',
      'search_transaction_rule': 'Transaktionsregel suchen',
      'search_transaction_rules': 'Transaktionsregeln suchen',
      'save_as_default_terms': 'Als Standardbedingungen speichern',
      'save_as_default_footer': 'Als Standard-Fußzeile speichern',
      'auto_sync': 'Autom. Synchronisation',
      'refresh_accounts': 'Konten aktualisieren',
      'upgrade_to_connect_bank_account':
          'Upgrade auf Enterprise zur Anbindung Ihres Bankkontos',
      'click_here_to_connect_bank_account':
          'Klicken Sie hier, um Ihr Bankkonto zu verbinden',
      'disable_2fa': 'Deaktivierung 2FA',
      'change_number': 'Nummer ändern',
      'resend_code': 'Code erneut senden',
      'base_type': 'Basis-Typ',
      'category_type': 'Kategorie-Typ',
      'bank_transaction': 'Transaktion',
      'bulk_print': 'PDF ausdrucken',
      'vendor_postal_code': 'Postleitzahl des Lieferanten',
      'preview_location': 'Vorschau des Standorts',
      'bottom': 'Unten',
      'side': 'Seite',
      'pdf_preview': 'PDF Vorschau',
      'long_press_to_select': 'Für Auswahl lange drücken',
      'purchase_order_number': 'Bestellnummer',
      'purchase_order_item': 'Bestellposition',
      'would_you_rate_the_app': 'Möchtest du diese App bewerten?',
      'include_deleted': 'Gelöschte eingeschlossen',
      'include_deleted_help': 'Schließe gelöschte Datensätze im Bericht ein',
      'due_on': 'Fällig am',
      'converted_transactions': 'Transaktionen erfolgreich konvertiert',
      'created_bank_account': 'Bankverbindung erfolgreich erstellt',
      'updated_bank_account': 'Bankverbindung erfolgreich aktualisiert',
      'edit_bank_account': 'Bankverbindung bearbeiten',
      'default_category': 'Standartkategorie',
      'account_type': 'Kontotyp',
      'new_bank_account': 'Bankverbindung hinzufügen',
      'connect_accounts': 'Konten verbinden',
      'manage_rules': 'Regeln verwalten',
      'search_category': 'Suche 1 Kategorie',
      'search_categories': 'Suche :count Kategorien',
      'min_amount': 'Mindestbetrag',
      'max_amount': 'Maximalbetrag',
      'selected': 'Gewählte',
      'converted_transaction': 'Transaktion erfolgreich konvertiert',
      'convert_to_payment': 'In Zahlung umwandeln',
      'deposit': 'Einzahlung',
      'withdrawal': 'Auszahlung',
      'deposits': 'Einzahlungen',
      'withdrawals': 'Auszahlungen',
      'matched': 'übereinstimmend',
      'unmatched': 'nicht übereinstimmend',
      'create_credit': 'Gutschrift erstellen',
      'update_credit': 'Gutschrift aktualisieren',
      'delete_credit': 'Gutschrift löschen',
      'transaction': 'Transaktion',
      'transactions': 'Transaktionen',
      'new_transaction': 'Neue Transaktion',
      'edit_transaction': 'Transaktion bearbeiten',
      'created_transaction': 'Transaktion erfolgreich erstellt',
      'updated_transaction': 'Transaktion erfolgreich aktualisiert',
      'archived_transaction': 'Transaktion erfolgreich archiviert',
      'deleted_transaction': 'Transaktion erfolgreich gelöscht',
      'removed_transaction': 'Transaktion erfolgreich entfernt',
      'restored_transaction': 'Transaktion erfolgreich wiederhergestellt',
      'search_transaction': 'Transaktion suchen',
      'search_transactions': ':count Transaktionen durchsuchen',
      'bank_account': 'Bankkonto',
      'bank_accounts': 'Kreditkarten & Banken',
      'archived_bank_account': 'Bankverbindung erfolgreich archiviert',
      'deleted_bank_account': 'Bankaccount erfolgreich gelöscht',
      'removed_bank_account': 'Bankaccount erfolgreich entfernt',
      'restored_bank_account': 'Bankaccount erfolgreich wiederhergestellt',
      'search_bank_account': 'Bankverbindung suchen',
      'search_bank_accounts': ':count Bankverbindungen durchsuchen',
      'connect': 'Verbinden',
      'mark_paid_payment_email': 'E-Mail bei Zahlungsmarkierung',
      'convert_to_project': 'In Projekt umwandeln',
      'client_email': 'Kunden E-Mail',
      'invoice_task_project':
          'In Aufgabe erfasstes Projekt in Rechnungen ausweisen',
      'invoice_task_project_help':
          'Zeigt den Projektnamen in den Rechnungspositionen an',
      'field': 'Feld',
      'period': 'Zeitraum',
      'fields_per_row': 'Felder pro Reihe',
      'total_active_invoices': 'Aktive Rechnungen',
      'total_outstanding_invoices': 'Ausstehende Rechnungen',
      'total_completed_payments': 'Abgeschlossene Zahlungen',
      'total_refunded_payments': 'Erstattete Zahlungen',
      'total_active_quotes': 'Aktive Angebote',
      'total_approved_quotes': 'Angenommene Angebote',
      'total_unapproved_quotes': 'Nicht genehmigte Angebote',
      'total_logged_tasks': 'Aufgezeichnete Aufgaben',
      'total_invoiced_tasks': 'In Rechnung gestellte Aufgaben',
      'total_paid_tasks': 'Bezahlte Aufgaben',
      'total_logged_expenses': 'Abgerechnete Ausgaben',
      'total_pending_expenses': 'Ausstehende Ausgaben',
      'total_invoiced_expenses': 'Abgerechnete Ausgaben',
      'total_invoice_paid_expenses': 'Ausgaben in Rechnung stellen',
      'activity_130': ':user hat Bestellung :purchase_order erstellt',
      'activity_131': ':user hat Bestellung :purchase_order aktualisiert',
      'activity_132': ':user hat Bestellung :purchase_order archiviert',
      'activity_133': ':user hat Bestellung :purchase_order gelöscht',
      'activity_134': ':user hat Bestellung :purchase_order wiederhergestellt',
      'activity_135': ':user mailte Bestellung :purchase_order',
      'activity_136': ':contact hat Bestellung :purchase_order angsehen',
      'activity_137': ':contact nahm Bestellung :purchase_order an',
      'vendor_portal': 'Lieferanten-Portal',
      'send_code': 'Code senden',
      'save_to_upload_documents': 'Speichern um Dokumente hochzuladen',
      'expense_tax_rates': 'Ausgabensteuersätze',
      'invoice_item_tax_rates': 'Steuersätze der Rechnungsposition',
      'verified_phone_number': 'Erfolgreich Rufnummer verifiziert',
      'code_was_sent': 'Es wurde ein Code per SMS versendet',
      'code_was_sent_to': 'Ein Code wurde per SMS an :number gesandt.',
      'resend': 'Erneut senden',
      'verify': 'Verifizieren',
      'enter_phone_number': 'Bitte geben Sie eine Telefonnummer an',
      'invalid_phone_number': 'Ungültige Telefonnummer',
      'verify_phone_number': 'Telefonnummer verifizieren',
      'verify_phone_number_help':
          'Bitte verifizieren Sie Ihre Telefonnummer, um E-Mails versenden zu können.',
      'verify_phone_number_2fa_help':
          'Bitte die Telefonnummer mit 2FA bestätigen',
      'merged_clients': 'Erfolgreich Kunden zusammengefasst',
      'merge_into': 'Zusammenführen in',
      'merge': 'Zusammenführen',
      'price_change_accepted': 'Preisänderung akzeptiert',
      'price_change_failed': 'Preisänderung fehlgeschlagen mit Code',
      'restore_purchases': 'Käufe wiederherstellen',
      'activate': 'Aktivieren',
      'connect_apple': 'Apple-Konto verbinden',
      'disconnect_apple': 'Apple-Konto entfernen',
      'disconnected_apple': 'Apple-Konto erfolgreich entfernt',
      'send_now': 'Jetzt senden',
      'received': 'Empfangen',
      'purchase_order_date': 'Bestelldatum',
      'converted_to_expense': 'Erfolgreich in eine Ausgabe umgewandelt',
      'converted_to_expenses': 'Erfolgreich in Ausgaben ungewandelt',
      'convert_to_expense': 'In Ausgabe umwandeln',
      'add_to_inventory': 'Zu Inventar hinzufügen',
      'added_purchase_order_to_inventory':
          'Bestellung erfolgreich zum Inventar hinzugefügt',
      'added_purchase_orders_to_inventory':
          'Bestellungen erfolgreich zum Inventar hinzugefügt',
      'client_document_upload': 'Kundendokument hochladen',
      'vendor_document_upload': 'Lieferantendokument hochladen',
      'vendor_document_upload_help':
          'Lieferanten das Hochladen von Dokumenten erlauben',
      'are_you_enjoying_the_app': 'Gefällt Ihnen die App?',
      'yes_its_great': 'Ja, es ist super!',
      'not_so_much': 'Nein, eher weniger',
      'would_you_rate_it':
          'Danke für das Feedback, mächten Sie die App bewerten?',
      'would_you_tell_us_more':
          'Es tut uns leid, das zu hören. Was gefällt Ihnen nicht?',
      'sure_happy_to': 'Gerne',
      'no_not_now': 'Nein, nicht jetzt.',
      'add': 'Hinzufügen',
      'last_sent_template': 'Zuletzt gesendete Vorlage',
      'enable_flexible_search': 'Flexible Suche aktivieren',
      'enable_flexible_search_help':
          'Übereinstimmung mit nicht zusammenhängenden Zeichen, dh. \'ct\' passt zu \'cat\'',
      'vendor_details': 'Lieferantendetails',
      'purchase_order_details': 'Bestelldetails',
      'qr_iban': 'QR IBAN',
      'besr_id': 'BESR-ID',
      'accept': 'Akzeptieren',
      'clone_to_purchase_order': 'Zur Bestellung duplizieren',
      'vendor_email_not_set': 'Lieferant hat keine E-Mail Adresse hinterlegt',
      'bulk_send_email': 'E-Mail senden',
      'marked_purchase_order_as_sent':
          'Bestellung erfolgreich als versendet markiert',
      'marked_purchase_orders_as_sent':
          'Bestellungen wurden erfolgreich als gesendet markiert',
      'accepted_purchase_order': 'Bestellung erfolgreich angenommen',
      'accepted_purchase_orders': 'Bestellungen erfolgreich angenommen',
      'cancelled_purchase_order': 'Bestellung erfolgreich abgelehnt',
      'cancelled_purchase_orders': 'Bestellungen erfolgreich abgelehnt',
      'accepted': 'Angenommen',
      'please_select_a_vendor': 'Bitte wählen Sie einen Lieferant aus',
      'purchase_order_total': 'Bestellung insgesamt',
      'email_purchase_order': 'E-Mail-Bestellung',
      'bulk_email_purchase_orders': 'E-Mail-Bestellungen',
      'disconnected_email': 'E-Mail-Adresse erfolgreich entfernt',
      'connect_email': 'E-Mail-Adresse verbinden',
      'disconnect_email': 'E-Mail-Adresse entfernen',
      'use_web_app_to_connect_microsoft':
          'Bitte verwenden Sie die Web-App, um eine Verbindung zu Microsoft herzustellen',
      'email_provider': 'E-Mail-Anbieter',
      'connect_microsoft': 'Microsoft-Konto verbinden',
      'disconnect_microsoft': 'Microsoft-Konto entfernen',
      'connected_microsoft': 'Erfolgreich mit Microsoft verbunden',
      'disconnected_microsoft':
          'Erfolgreich die Verbindung mit Microsoft getrennt',
      'microsoft_sign_in': 'Einloggen mit Microsoft',
      'microsoft_sign_up': 'Anmelden mit Microsoft',
      'emailed_purchase_order':
          'Erfolgreich in die Warteschlange gestellte und zu versendende Bestellung',
      'emailed_purchase_orders':
          'Erfolgreich in die Warteschlange gestellte und zu versendende Bestellungen',
      'enable_react_app': 'Wechsel zur React Web App',
      'purchase_order_design': 'Bestellungsdesign',
      'purchase_order_terms': 'Bestellbedingungen',
      'purchase_order_footer': 'Fußzeile der Bestellung',
      'require_purchase_order_signature': 'Bestellunterschrift',
      'require_purchase_order_signature_help':
          'Die Unterschrift des Lieferanten fordern.',
      'purchase_order': 'Bestellung',
      'purchase_orders': 'Bestellungen',
      'new_purchase_order': 'Neue Bestellung',
      'edit_purchase_order': 'Bestellung bearbeiten',
      'created_purchase_order': 'Erfolgreich Bestellung erstellt',
      'updated_purchase_order': 'Erfolgreich Bestellung aktualisiert',
      'archived_purchase_order': 'Erfolgreich Bestellung archiviert',
      'deleted_purchase_order': 'Erfolgreich Bestellung gelöscht',
      'removed_purchase_order': 'Erfolgreich Bestellung entfernt',
      'restored_purchase_order': 'Erfolgreich Bestellung archiviert',
      'search_purchase_order': 'Bestellung suchen',
      'search_purchase_orders': 'Bestellungen suchen',
      'login_url': 'Login-URL',
      'payment_settings': 'Zahlungseinstellungen',
      'default': 'Standard',
      'stock_quantity': 'Lagerbestand',
      'notification_threshold': 'Mindestbestandsmeldung',
      'track_inventory': 'Inventar verwalten',
      'track_inventory_help':
          'Anzeigen eines Feldes für den Produktbestand und Aktualisierung des Bestandes, wenn die Rechnung versendet wurde',
      'stock_notifications': 'Lagerbestandsmeldung',
      'stock_notifications_help':
          'Automatische E-Mail versenden, wenn der Bestand unter das Minimum sinkt',
      'vat': 'Steuer',
      'standing': 'Aktueller Stand',
      'view_map': 'Karte anzeigen',
      'set_default_design': 'Standard-Design festlegen',
      'add_gateway': 'Zahlungsanbieter hinzufügen',
      'add_gateway_help_message':
          'Payment-Gateway hinzufügen (z. B. Stripe, WePay oder PayPal), um Online-Zahlungen anbieten zu können',
      'left': 'Links',
      'right': 'Rechts',
      'center': 'Mittig',
      'page_numbering': 'Seitennummerierung',
      'page_numbering_alignment': 'Ausrichtung der Seitennummerierung',
      'invoice_sent_notification_label': 'Rechnung versendet',
      'show_product_description': 'Produktbeschreibung anzeigen',
      'show_product_description_help':
          'Beschreibung bei der Produktauswahl anzeigen',
      'invoice_items': 'Rechnungselemente',
      'quote_items': 'Angebotselemente',
      'profitloss': 'Gewinn und Verlust',
      'import_format': 'Import-Format',
      'export_format': 'Export-Format',
      'export_type': 'Export-Typ',
      'stop_on_unpaid': 'Stoppen falls nicht bezahlt',
      'stop_on_unpaid_help':
          'Erstelle keine neuen wiederkehrenden Rechnungen, falls die vorige Rechnung noch nicht bezahlt wurde.',
      'use_quote_terms': 'Benutze Angebotsbedingungen',
      'use_quote_terms_help':
          'Wenn ein Angebot in eine Rechnung umgewandelt wird',
      'add_country': 'Land hinzufügen',
      'enable_tooltips': 'Quickinfo/Tooltips anzeigen',
      'enable_tooltips_help':
          'Quickinfo/Tooltips beim Drüberfahren mit der Maus anzeigen',
      'multiple_client_error':
          'Fehler: Einträge sind mehr als einem Kunden zugeordnet',
      'register_label': 'Benutzerkonto in wenigen Sekunden erstellen',
      'login_label': 'Mit einem bestehenden Benutzerkonto anmelden',
      'add_to_invoice': 'Zur Rechnung :invoice hinzufügen',
      'no_invoices_found': 'Keine Rechnungen gefunden',
      'week': 'Woche',
      'created_record': 'Eintrag erfolgreich erstellt.',
      'auto_archive_paid_invoices': 'Bezahltes automatisch archivieren',
      'auto_archive_paid_invoices_help':
          'Automatische Archivierung von Rechnungen, wenn diese als bezahlt markiert werden.',
      'auto_archive_cancelled_invoices': 'Auto-Archivierung abgebrochen',
      'auto_archive_cancelled_invoices_help':
          'Automatisch Rechnungen archivieren, wenn diese storniert wurden.',
      'alternate_pdf_viewer': 'Alternativer PDF Viewer',
      'alternate_pdf_viewer_help':
          'Verbessere das Scrolling über die PDF-Vorschau [BETA]',
      'invoice_currency': 'Rechnungs-Währung',
      'range': 'Bereich',
      'tax_amount1': 'Steuerhöhe 1',
      'tax_amount2': 'Steuerhöhe 2',
      'tax_amount3': 'Steuerhöhe 3',
      'create_project': 'Projekt erstellen',
      'update_project': 'Projekt aktualisieren',
      'view_task': 'Aufgabe anzeigen',
      'cancel_invoice': 'Stornieren',
      'changed_status': 'Erfolgreich Aufgabenstatus geändert',
      'change_status': 'Status ändern',
      'fees_sample':
          'Die Gebühren für eine Rechnung über :amount  würden :total betragen.',
      'enable_touch_events': 'Touchscreen-Modus aktivieren',
      'enable_touch_events_help': 'Scrollen durch wischen',
      'after_saving': 'Nach dem Speichern',
      'view_record': 'Datensatz anzeigen',
      'enable_email_markdown': 'Markdown in E-Mails verwenden',
      'enable_email_markdown_help':
          'Visuellen Markdown-Editor für E-Mails verwenden',
      'enable_pdf_markdown': 'Markdown in PDFs verwenden',
      'json_help':
          'Achtung: JSON-Dateien, die mit v4 der App erstellt wurden, werden nicht unterstützt',
      'release_notes': 'Versionshinweise',
      'upgrade_to_view_reports':
          'Wechseln Sie Ihren Tarif, um Berichte ansehen zu können',
      'started_tasks': ':value Aufgaben erfolgreich gestartet',
      'stopped_tasks': ':value Aufgaben erfolgreich angehalten',
      'approved_quote': 'Angebot erfolgreich angenommen',
      'approved_quotes': ':value Angebote erfolgreich angenommen',
      'approve': 'Angebot annehmen',
      'client_website': 'Kunden-Website',
      'invalid_time': 'Ungültige Zeit',
      'client_shipping_state': 'Liefer-Region Kunde',
      'client_shipping_city': 'Lieferort Kunde',
      'client_shipping_postal_code': 'Liefer-PLZ Kunde',
      'client_shipping_country': 'Kunde Lieferung LAND',
      'load_pdf': 'PDF laden',
      'start_free_trial': 'Kostenlose Testversion starten',
      'start_free_trial_message':
          'Starten Sie Ihre KOSTENLOSE 14-tägige Testversion des Pro-Tarifs',
      'due_on_receipt': 'Fällig bei Erhalt',
      'is_paid': 'Ist bezahlt',
      'age_group_paid': 'Bezahlt',
      'id': 'ID',
      'convert_to': 'Umwandeln in',
      'client_currency': 'Kundenwährung',
      'company_currency': 'Firmenwährung',
      'purged_client': 'Kunde erfolgreich bereinigt',
      'custom_emails_disabled_help':
          'Um Spam zu verhindern braucht es ein Upgrade zu einem bezahlten Account um das E-Mail anzupassen.',
      'upgrade_to_add_company':
          'Wechseln Sie Ihren Tarif, um weitere Firmen hinzufügen zu können',
      'small': 'Klein',
      'marked_credit_as_paid': 'Gutschrift erfolgreich als bezahlt markiert',
      'marked_credits_as_paid': 'Erfolgreich Kredite als bezahlt markiert',
      'wait_for_loading':
          'Daten werden geladen - bitte warten Sie, bis der Vorgang abgeschlossen ist',
      'wait_for_saving':
          'Datenspeicherung - bitte warten Sie, bis der Vorgang abgeschlossen ist',
      'html_preview_warning':
          'Hinweis: Die hier vorgenommenen Änderungen werden nur in der Vorschau angezeigt, sie müssen in den obigen Registerkarten angewendet werden, um gespeichert zu werden.',
      'remaining': 'Verbleibende',
      'invoice_paid': 'Rechnung bezahlt',
      'activity_120':
          ':user erstellte wiederkehrende Ausgabe :recurring_expense',
      'activity_121':
          ':user aktualisiert wiederkehrende Ausgabe :recurring_expense',
      'activity_122':
          ':user archivierte wiederkehrende Ausgabe :recurring_expense',
      'activity_123': ':user löschte wiederkehrende Ausgabe :recurring_expense',
      'activity_124':
          ':user stellte wiederkehrende Ausgabe :recurring_expense wieder her',
      'normal': 'Normal',
      'large': 'Groß',
      'extra_large': 'Extra Groß',
      'show_pdf_preview': 'PDF-Vorschau anzeigen',
      'show_pdf_preview_help':
          'PDF-Vorschau bei der Bearbeitung von Rechnungen anzeigen',
      'print_pdf': 'PDF drucken',
      'remind_me': 'Erinnere mich',
      'instant_bank_pay': 'Instant Bank Pay',
      'click_selected': 'Ausgewähltes anklicken',
      'hide_preview': 'Vorschau ausblenden',
      'edit_record': 'Datensatz bearbeiten',
      'credit_is_more_than_invoice':
          'Der Kreditbetrag kann nicht höher sein als der Rechnungsbetrag',
      'giropay': 'GiroPay',
      'direct_debit': 'Lastschriftverfahren',
      'please_set_a_password': 'Bitte legen Sie ein Kontopasswort fest',
      'set_password': 'Passwort festlegen',
      'disconnected_gateway': 'Gateway erfolgreich getrennt',
      'disconnect': 'Trennen',
      'add_to_invoices': 'Zu Rechnungen hinzufügen',
      'acss': 'ACSS-Lastschrift',
      'becs': 'BECS-Lastschriftverfahren',
      'bulk_download': 'Herunterladen',
      'persist_data_help':
          'Daten lokal speichern, damit die Anwendung schneller starten kann. (Deaktivierung kann die Leistung bei großen Konten verbessern)',
      'persist_ui': 'Benutzeroberfläche beibehalten',
      'persist_ui_help':
          'UI-Status lokal speichern, damit die Anwendung an der letzten Position startet (Deaktivierung kann die Leistung verbessern)',
      'client_postal_code': 'Postleitzahl des Kunden',
      'client_vat_number': 'USt-IdNr. des Kunden',
      'has_tasks': 'Hat Aufgaben',
      'registration': 'Registrierung',
      'unauthorized_stripe_warning':
          'Bitte autorisieren Sie Stripe zur Annahme von Online-Zahlungen.',
      'view_expense': 'Ausgabe # :expense ansehen',
      'view_statement': 'Zeige Bericht',
      'sepa': 'SEPA-Lastschrift',
      'ideal': 'iDEAL',
      'przelewy24': 'Przelewy24',
      'eps': 'EPS',
      'fpx': 'FPX',
      'update_all_records': 'Alle Datensätze aktualisieren',
      'system': 'System',
      'set_default_company': 'Standardunternehmen festlegen',
      'updated_company': 'Unternehmen wurde erfolgreich aktualisiert',
      'kbc': 'KBC',
      'bancontact': 'Bancontact',
      'why_are_you_leaving':
          'Helfen Sie uns, uns zu verbessern, indem Sie uns sagen, warum (optional)',
      'webhook_success': 'Webhook erfolgreich',
      'error_cross_client_tasks':
          'Die Aufgaben müssen alle zum selben Kunden gehören',
      'error_cross_client_expenses':
          'Die Ausgaben müssen alle zu demselben Kunden gehören',
      'app': 'App',
      'for_best_performance':
          'Für die beste Leistung laden Sie die App herunter :app',
      'gross_line_total': 'Bruttozeilensumme',
      'bulk_email_invoices': 'E-Mail-Rechnungen',
      'bulk_email_quotes': 'E-Mail-Angebote',
      'bulk_email_credits': 'E-Mail-Gutschriften',
      'from_name': 'Absendername',
      'clone_to_expense': 'Klonen zu Ausgabe',
      'recurring_expense': 'Wiederkehrende Ausgabe',
      'recurring_expenses': 'Wiederkehrende Ausgaben',
      'new_recurring_expense': 'Wiederkehrende Ausgabe eingeben',
      'edit_recurring_expense': 'Wiederkehrende Ausgabe bearbeiten',
      'created_recurring_expense': 'Wiederkehrende Ausgabe wurde erstellt',
      'updated_recurring_expense': 'Wiederkehrende Ausgabe wurde aktualisiert',
      'archived_recurring_expense': 'Wiederkehrende Ausgabe wurde archiviert',
      'deleted_recurring_expense':
          'Erfolgreich wiederkehrende Ausgabe entfernt',
      'removed_recurring_expense':
          'Erfolgreich wiederkehrende Ausgaben entfernt',
      'restored_recurring_expense':
          'Wiederkehrende Ausgabe wurde wiederhergestellt',
      'search_recurring_expense': 'Wiederkehrende Ausgaben suchen',
      'search_recurring_expenses': 'Wiederkehrende Ausgaben suchen',
      'last_sent_date': 'Datum des letzten Versands',
      'include_drafts': 'Entwürfe einschließen',
      'include_drafts_help':
          'Entwürfe von Aufzeichnungen in Berichte einbeziehen',
      'is_invoiced': 'Ist in Rechnung gestellt',
      'change_plan': 'Tarif verwalten',
      'persist_data': 'Daten aufbewahren',
      'customer_count': 'Kundenzahl',
      'verify_customers': 'Kunden überprüfen',
      'google_analytics': 'Google Analytics',
      'google_analytics_tracking_id': 'Google Analytics Tracking ID',
      'decimal_comma': 'Dezimaltrennzeichen',
      'use_comma_as_decimal_place':
          'Komma als Dezimalstelle in Formularen verwenden',
      'select_method': 'Methode auswählen',
      'select_platform': 'Plattform auswählen',
      'use_web_app_to_connect_gmail':
          'Bitte verwenden Sie die Web-App, um sich mit Gmail zu verbinden',
      'expense_tax_help': 'Postensteuersätze sind deaktiviert',
      'enable_markdown': 'Markdown verwenden',
      'enable_markdown_help':
          'Konvertierung von Markdown in HTML in der PDF-Datei',
      'user_guide': 'Nutzer-Anleitung',
      'add_second_contact': 'Zweiten Kontakt hinzufügen',
      'previous_page': 'Vorherige Seite',
      'next_page': 'Nächste Seite',
      'export_colors': 'Farben exportieren',
      'import_colors': 'Farben importieren',
      'clear_all': 'Alle löschen',
      'contrast': 'Kontrast',
      'custom_colors': 'Eigene Farben',
      'colors': 'Farben',
      'sidebar_active_background_color':
          'Hintergrundfarbe der aktiven Seitenleiste',
      'sidebar_active_font_color': 'Schriftfarbe der aktiven Seitenleiste',
      'sidebar_inactive_background_color':
          'Hintergrundfarbe der inaktiven Seitenleiste',
      'sidebar_inactive_font_color': 'Seitenleiste Inaktiv Schriftfarbe',
      'table_alternate_row_background_color':
          'Alternierende Zeilenhintergrundfarbe der Tabelle',
      'invoice_header_background_color':
          'Hintergrundfarbe der Rechnungskopfzeile',
      'invoice_header_font_color': 'Schriftfarbe der Rechnungskopfzeile',
      'net_subtotal': 'Netto',
      'review_app': 'App bewerten',
      'check_status': 'Status prüfen',
      'free_trial': 'Kostenlose Testversion',
      'free_trial_ends_in_days':
          'Die Testversion des Pro-Tarifs endet in :count Tagen, klicken Sie zum Upgrade.',
      'free_trial_ends_today':
          'Heute ist der letzte Tag des Pro-Tarifs, klicken Sie zum Upgrade.',
      'change_email': 'E-Mail ändern',
      'client_portal_domain_hint':
          'Konfigurieren Sie optional eine separate Kunden-Portal-Domäne',
      'tasks_shown_in_portal': 'Im Portal angezeigte Aufgaben',
      'uninvoiced': 'Nicht in Rechnung gestellt',
      'subdomain_guide':
          'Die Subdomain wird im Kundenportal verwendet, um Links zu personalisieren, die Ihrer Marke entsprechen. z.B. https://your-brand.invoicing.co',
      'send_time': 'Sendezeit',
      'import_data': 'Importiere Daten',
      'import_settings': 'Einstellungen importieren',
      'json_file_missing': 'Bitte stellen Sie die JSON-Datei zur Verfügung',
      'json_option_missing':
          'Bitte wählen Sie, um die Einstellungen und/oder Daten zu importieren',
      'json': 'JSON',
      'no_payment_types_enabled': 'Keine Zahlungsarten aktiviert',
      'wait_for_data':
          'Bitte warten Sie, bis die Daten vollständig geladen sind',
      'net_total': 'Netto Gesamt',
      'has_taxes': 'enthält Steuern',
      'import_customers': 'Kunden importieren',
      'imported_customers': 'Successfully started importing customers',
      'login_success': 'Erfolgreiche Anmeldung',
      'login_failure': 'Anmeldung fehlgeschlagen',
      'exported_data':
          'Sobald die Datei fertig ist, erhalten Sie eine E-Mail mit einem Download-Link',
      'include_deleted_clients': 'Gelöschte Kunden einbeziehen',
      'include_deleted_clients_help': 'Datensätze von gelöschten Kunden laden',
      'step_1_sign_in': 'Schritt 1: Registrieren',
      'step_2_authorize': 'Schritt 2: autorisieren',
      'account_id': 'Konto-ID',
      'migration_not_yet_completed':
          'Die Migration ist noch nicht abgeschlossen',
      'activity_100':
          ':user hat die wiederkehrende Rechnung :recurring_invoice erstellt.',
      'activity_101':
          ':user hat die wiederkehrende Rechnung :recurring_invoice aktuallisiert',
      'activity_102':
          ':user hat die wiederkehrende Rechnung :recurring_invoice archiviert',
      'activity_103':
          ':user hat die wiederkehrende Rechnung :recurring_invoice gelöscht.',
      'activity_104':
          ':user hat die wiederkehrende Rechnung :recurring_invoice wiederhergestellt.',
      'show_task_end_date': 'Ende der Aufgabe anzeigen',
      'show_task_end_date_help':
          'Aktivieren Sie die Angabe des Enddatums der Aufgabe',
      'gateway_setup': 'Gateway-Einstellungen',
      'preview_sidebar': 'Vorschau der Seitenleiste',
      'years_data_shown': 'Daten für wie viele Jahre anzeigen?',
      'ended_all_sessions': 'alle Sitzungen erfolgreich beendet',
      'end_all_sessions': 'Alle Sitzungen beenden',
      'count_session': '1 Sitzung',
      'count_sessions': ':count Sitzungen',
      'invoice_created': 'Rechnung erstellt',
      'quote_created': 'Angebot erstellt',
      'credit_created': 'Gutschrift erstellt',
      'pro': 'Pro',
      'enterprise': 'Enterprise',
      'last_updated': 'Zuletzt aktualisiert',
      'invoice_item': 'Rechnungsposition',
      'quote_item': 'Angebotsposition',
      'contact_first_name': 'Kontakt Vorname',
      'contact_last_name': 'Kontakt Nachname',
      'order': 'Bestellung',
      'unassigned': 'Nicht zugewiesen',
      'partial_value':
          'Muss grösser als Null und kleiner als der Gesamtbetrag sein',
      'search_kanban': 'Kanban auswählen',
      'search_kanbans': 'Kanban auswählen',
      'kanban': 'Kanban',
      'enable': 'Aktivieren',
      'move_top': 'Ganz nach oben verschieben',
      'move_up': 'Nach oben verschieben',
      'move_down': 'Nach unten verschieben',
      'move_bottom': 'Ganz nach unten verschieben',
      'subdomain_help':
          'Passen Sie die Rechnungslink-Subdomäne an oder stellen Sie die Rechnung auf Ihrer eigenen Webseite zur Verfügung.',
      'body_variable_missing':
          'Fehler: das benutzerdefinierte E-Mail Template muss die :body Variable beinhalten',
      'add_body_variable_message':
          'bitte stelle sicher das die :body Variable eingefügt ist',
      'view_date_formats': 'Zeige Datumsformate',
      'is_viewed': 'Ist angesehen',
      'letter': 'Letter',
      'legal': 'Rechtliches',
      'page_layout': 'Seiten Layout',
      'portrait': 'Hochformat',
      'landscape': 'Querformat',
      'owner_upgrade_to_paid_plan':
          'Der Kontoinhaber kann auf einen kostenpflichtigen Tarif upgraden, um die erweiterten erweiterten Einstellungen zu aktivieren',
      'upgrade_to_paid_plan':
          'Führen Sie ein Upgrade auf einen kostenpflichtigen Tarif durch, um die erweiterten Einstellungen zu aktivieren',
      'invoice_payment_terms': 'Zahlungsbedingungen für Rechnungen',
      'quote_valid_until': 'Angebot gültig bis',
      'no_headers': 'Keine Header',
      'add_header': 'Header hinzufügen',
      'remove_header': 'Kopfzeile entfernen',
      'return_url': 'Return-URL',
      'rest_method': 'REST-Methode',
      'header_key': 'Header-Key',
      'header_value': 'Header-Wert',
      'recurring_products': 'Wiederkehrende Produkte',
      'promo_code': 'Gutscheincode',
      'promo_discount': 'Promo-Rabatt',
      'allow_cancellation': 'Storno ermöglichen',
      'per_seat_enabled': 'Pro Platz Aktiviert',
      'max_seats_limit': 'Max. Plätze Limit',
      'trial_enabled': 'Testversion aktiv',
      'trial_duration': 'Testzeitraum',
      'allow_query_overrides': 'Überschreiben von Abfragen zulassen',
      'allow_plan_changes': 'Planänderungen zulassen',
      'plan_map': 'Plan Map',
      'refund_period': 'Erstattungszeitraum',
      'webhook_configuration': 'Webhook-Konfiguration',
      'purchase_page': 'Kauf-Seite',
      'security': 'Sicherheit',
      'email_bounced': 'E-Mail zurückgesendet',
      'email_spam_complaint': 'Spam-Beschwerde',
      'email_delivery': 'E-Mail-Zustellung',
      'webhook_response': 'Webhook-Antwort',
      'pdf_response': 'PDF-Antwort',
      'authentication_failure': 'Authentifizierungsfehler',
      'pdf_failed': 'PDF fehgeschlagen',
      'pdf_success': 'PDF erfolgreich',
      'modified': 'geändert',
      'payment_link': 'Zahlungslink',
      'new_payment_link': 'Neuer Zahlungslink',
      'edit_payment_link': 'Zahlungslink bearbeiten',
      'created_payment_link': 'Zahlungslink erfolgreich erstellt',
      'updated_payment_link': 'Zahlungslink erfolgreich aktualisiert',
      'archived_payment_link': 'Zahlungslink erfolgreich archiviert',
      'deleted_payment_link': 'Zahlungslink erfolgreich gelöscht',
      'removed_payment_link': 'Zahlungslink erfolgreich entfernt',
      'restored_payment_link': 'Zahlungslink erfolgreich wiederhergestellt',
      'search_payment_link': 'Suche 1 Zahlungslink',
      'search_payment_links': 'Suchen :count Zahlungslinks',
      'subdomain_is_not_available': 'Subdomain ist nicht verfügbar',
      'connect_gmail': 'Mit Gmail verbinden',
      'disconnect_gmail': 'von Gmail trennen',
      'connected_gmail': 'Mit Gmail erfolgreich verbunden',
      'disconnected_gmail': 'Von Gmail erfolgreich getrennt',
      'update_fail_help':
          'Änderungen an der Codebasis können das Update blockieren, Sie können diesen Befehl ausführen, um die Änderungen zu verwerfen:',
      'client_id_number': 'Kundennummer',
      'count_minutes': ':count Minuten',
      'password_timeout': 'Passwort-Timeout',
      'shared_invoice_credit_counter': 'Rechnung-/Gutschrifts-Zähler teilen',
      'use_last_email': 'Vorherige E-Mail benutzen',
      'activate_company': 'Unternehmen aktivieren',
      'activate_company_help':
          'E-Mails, wiederkehrende Rechnungen und Benachrichtigungen aktivieren',
      'an_error_occurred_try_again':
          'Ein Fehler ist aufgetreten, bitte versuchen Sie es erneut.',
      'please_first_set_a_password': 'Bitte vergeben Sie zuerst ein Passwort.',
      'changing_phone_disables_two_factor':
          'Achtung: Das Ändern Ihrer Telefonnummer wird die Zwei-Faktor-Authentifizierung deaktivieren',
      'help_translate': 'Hilf mit beim Übersetzen',
      'please_select_a_country': 'Bitte wählen Sie ein Land',
      'resend_invite': 'Einladung erneut versenden',
      'disabled_two_factor': '2FA erfolgreich deaktiviert',
      'connected_google': 'Konto erfolgreich verbunden.',
      'disconnected_google': 'Konto erfolgreich getrennt.',
      'delivered': 'zugestellt',
      'bounced': 'Abpraller',
      'spam': 'Spam',
      'view_docs': 'Dokumentation ansehen.',
      'enter_phone_to_enable_two_factor':
          'Bitte gib eine Handynummer an, um die Zwei-Faktor-Authentifizierung zu aktivieren',
      'send_sms': 'SMS senden',
      'sms_code': 'SMS-Code',
      'two_factor_setup_help': 'Barcode mit :link kompatibler App scannen.',
      'enabled_two_factor':
          'Zwei-Faktor-Authentifizierung erfolgreich aktiviert',
      'connect_google': 'Google-Konto verbinden',
      'disconnect_google': 'Google-Konto entfernen',
      'enable_two_factor': 'Zwei-Faktor-Authentifizierung',
      'disable_two_factor': 'Zwei-Faktor-Authentifizierung deaktivieren',
      'require_password_with_social_login':
          'Anmeldung per Social Login notwendig',
      'stay_logged_in': 'Eingeloggt bleiben',
      'session_about_to_expire': 'Warnung: Ihre Sitzung läuft bald ab',
      'count_hours': ':count Stunden',
      'count_day': '1 Tag',
      'count_days': ':count Tage',
      'web_session_timeout': 'Web-Sitzungs-Timeout',
      'security_settings': 'Sicherheitseinstellungen',
      'resend_email': 'Bestätigungs-E-Mail erneut versenden',
      'confirm_your_email_address': 'Bitte bestätigen Sie Ihre E-Mail-Adresse',
      'refunded_payment': 'Zahlung erstattet',
      'partially_unapplied': 'Teilweise unangewandt',
      'select_a_gmail_user':
          'Bitte wählen Sie einen mit Gmail authentifizierten Benutzer',
      'list_long_press': 'Liste Langes Drücken',
      'show_actions': 'Zeige Aktionen',
      'start_multiselect': 'Mehrfachauswahl',
      'email_sent_to_confirm_email':
          'Eine E-Mail wurde versandt um Ihre E-Mail-Adresse zu bestätigen.',
      'counter_pattern_error':
          'Um :client_counter zu verwenden, fügen Sie bitte entweder :client_number oder :client_id_number hinzu, um Konflikte zu vermeiden',
      'this_quarter': 'Dieses Quartal',
      'last_quarter': 'Letztes Quartal',
      'to_update_run': 'Zum Änderungslauf',
      'convert_to_invoice': 'In Rechnung umwandeln',
      'registration_url': 'Registrierungs-URL',
      'invoice_project': 'Projekt berechnen',
      'invoice_task': 'Aufgabe in Rechnung stellen',
      'invoice_expense': 'Ausgabe abrechnen',
      'search_payment_term': 'Suche 1 Zahlungsbedingung',
      'search_payment_terms': 'Suche :count Zahlungsbedingungen',
      'save_and_preview': 'Speichern und Vorschau anzeigen',
      'save_and_email': 'Speichern und verschicken',
      'supported_events': 'Unterstützte Ereignisse',
      'converted_amount': 'Umgerechneter Betrag',
      'converted_balance': 'Gutschriftstand',
      'converted_paid_to_date': 'Umgewandelt Bezahlt bis Datum',
      'converted_credit_balance': 'Umgerechneter Gutschriftsbetrag',
      'converted_total': 'Umgerechnet Total',
      'is_sent': 'Gesendet',
      'default_documents': 'Standard-Dokumente',
      'document_upload': 'Dokument hochladen',
      'document_upload_help': 'Erlaube Kunden Dokumente hochzuladen',
      'expense_total': 'Ausgabensumme',
      'enter_taxes': 'Steuersätze eingeben',
      'by_rate': 'Nach Satz',
      'by_amount': 'Nach Betrag',
      'enter_amount': 'Betrag eingeben',
      'before_taxes': 'Vor Steuern',
      'after_taxes': 'Nach Steuern',
      'color': 'Farbe',
      'show': 'Anzeigen',
      'hide': 'Verbergen',
      'empty_columns': 'Leere Spalten',
      'debug_mode_is_enabled': 'Der Entwicklungsmodus ist aktiviert',
      'debug_mode_is_enabled_help':
          'Warnung: Es ist für die Verwendung auf lokalen Rechnern gedacht und kann Anmeldedaten preisgeben. Klicken Sie, um mehr zu erfahren.',
      'running_tasks': 'Laufende Aufgaben',
      'recent_tasks': 'Kürzliche Aufgaben',
      'recent_expenses': 'Kürzliche Ausgaben',
      'upcoming_expenses': 'Zukünftige Ausgaben',
      'update_app': 'App aktualisieren',
      'started_import': 'Import erfolgreich gestartet',
      'duplicate_column_mapping': 'Dupliziere Spaltenzuordnung',
      'uses_inclusive_taxes': 'Benutzt Inklusive Steuern',
      'is_amount_discount': 'Ist Betrag ermäßigt',
      'column': 'Spalte',
      'sample': 'Beispiel',
      'map_to': 'Zuordnen',
      'import': 'Importieren',
      'first_row_as_column_names': 'Benutze erste Zeile als Spaltenüberschrift',
      'select_file': 'Bitte wählen sie eine Datei',
      'no_file_selected': 'Keine Datei ausgewählt',
      'csv_file': 'Wähle CSV Datei',
      'csv': 'CSV',
      'freshbooks': 'FreshBooks',
      'invoice2go': 'Invoice2go',
      'invoicely': 'Invoicely',
      'waveaccounting': 'Wave Accounting',
      'zoho': 'Zoho',
      'accounting': 'Buchhaltung',
      'required_files_missing': 'Bitte geben Sie alle CSV-Dateien an.',
      'import_type': 'Import-Typ',
      'html_mode': 'HTML Modus',
      'html_mode_help':
          'Vorschau von Aktualisierungen schneller, aber weniger genau',
      'view_licenses': 'Lizenzen anzeigen',
      'webhook_url': 'Webhook URL',
      'fullscreen_editor': 'Vollbild-Editor',
      'sidebar_editor': 'Seitenmenü-Editor',
      'please_type_to_confirm':
          'Bitte geben Sie \':value\' zur Bestätigung ein',
      'purge': 'Bereinigen',
      'service': 'Leistung',
      'clone_to': 'Duplizieren zu',
      'clone_to_other': 'Als anderen Typ duplizieren',
      'labels': 'Beschriftung',
      'add_custom': 'Beschriftung hinzufügen',
      'payment_tax': 'Steuer-Zahlung',
      'expense_tax': 'Expense Tax',
      'unpaid': 'Unbezahlt',
      'white_label': 'White Label',
      'delivery_note': 'Lieferschein',
      'sent_invoices_are_locked': 'Versendete Rechnungen sind gesperrt',
      'paid_invoices_are_locked': 'Bezahlte Rechnungen sind gesperrt',
      'source_code': 'Quellcode',
      'app_platforms': 'App-Plattformen',
      'invoice_late': 'Rechnung überfällig',
      'quote_expired': 'Angebot abgelaufen',
      'partial_due': 'Anzahlung',
      'invoice_total': 'Rechnungsbetrag',
      'quote_total': 'Angebotssumme',
      'credit_total': 'Gesamtgutschrift',
      'recurring_invoice_total': 'Gesamtbetrag',
      'actions': 'Aktionen',
      'expense_number': 'Ausgabennummer',
      'task_number': 'Aufgabennummer',
      'project_number': 'Projektnummer',
      'project_name': 'Projektname',
      'warning': 'Warnung',
      'view_settings': 'Einstellungen anzeigen',
      'company_disabled_warning':
          'Warnung: diese Firma wurde noch nicht aktiviert',
      'late_invoice': 'Rechnung überfällig',
      'expired_quote': 'Abgelaufenes Angebot',
      'remind_invoice': 'Rechnungsmahnung',
      'cvv': 'Kartenprüfziffer',
      'client_name': 'Kunde',
      'client_phone': 'Kunden Telefon',
      'required_fields': 'Benötigte Felder',
      'calculated_rate': 'Berechneter Satz',
      'default_task_rate': 'Standard-Stundenlohn',
      'clear_cache': 'Zwischenspeicher leeren',
      'sort_order': 'Sortierreihenfolge',
      'task_status': 'Status',
      'task_statuses': 'Aufgaben Status',
      'new_task_status': 'Neuer Aufgaben Status',
      'edit_task_status': 'Aufgaben Status bearbeiten',
      'created_task_status': 'Aufgaben Status erfolgreich erstellt',
      'updated_task_status': 'Aufgabenstatus erfolgreich aktualisiert',
      'archived_task_status': 'Aufgaben Status erfolgreich archiviert',
      'deleted_task_status': 'Aufgaben Status erfolgreich gelöscht',
      'removed_task_status': 'Aufgaben Status erfolgreich entfernt',
      'restored_task_status': 'Aufgaben Status erfolgreich wiederhergestellt',
      'archived_task_statuses': ':value Aufgaben-Status erfolgreich archiviert',
      'deleted_task_statuses': ':value Aufgaben-Status erfolgreich gelöscht',
      'restored_task_statuses':
          ':value Aufgaben-Status erfolgreich wiederhergestellt',
      'search_task_status': 'Suche 1 Aufgaben Status',
      'search_task_statuses': 'Suche :count Aufgaben Status',
      'show_tasks_table': 'Zeige Aufgaben Tabelle',
      'show_tasks_table_help':
          'Beim Erstellen von Rechnungen immer die Aufgabenauswahl anzeigen',
      'invoice_task_timelog':
          'In Aufgabe erfasste Zeiten in Rechnungen ausweisen',
      'invoice_task_timelog_help':
          'Zeigt Zeitdetails in den Rechnungspositionen an',
      'invoice_task_datelog':
          'In Aufgabe erfasstes Datum in Rechnungen ausweisen',
      'invoice_task_datelog_help':
          'Zeigt Datumsdetails in den Rechnungspositionen an',
      'auto_start_tasks_help': 'Beginne Aufgabe vor dem Speichern',
      'configure_statuses': 'Status bearbeiten',
      'task_settings': 'Aufgaben-Einstellungen',
      'configure_categories': 'Kategorien bearbeiten',
      'expense_categories': 'Ausgabenkategorien',
      'new_expense_category': 'Neue Ausgabenkategorie',
      'edit_expense_category': 'Ausgaben Kategorie bearbeiten',
      'created_expense_category': 'Ausgabenkategorie erfolgreich erstellt',
      'updated_expense_category': 'Ausgabenkategorie erfolgreich aktualisiert',
      'archived_expense_category': 'Ausgabenkategorie erfolgreich archiviert',
      'deleted_expense_category': 'Kategorie erfolgreich gelöscht',
      'removed_expense_category': 'Ausgaben Kategorie erfolgreich entfernt',
      'restored_expense_category':
          'Ausgabenkategorie erfolgreich wiederhergestellt',
      'archived_expense_categories':
          ':count Ausgabenkategorien erfolgreich archiviert',
      'deleted_expense_categories':
          ':value Ausgabenkategorien erfolgreich gelöscht',
      'restored_expense_categories':
          ':value Ausgabenkategorien erfolgreich wiederhergestellt',
      'search_expense_category': 'Suche 1 Ausgabenkategorie',
      'search_expense_categories': 'Suche :count Ausgabenkategorie',
      'use_available_credits': 'Verfügbare Gutschriften verwenden',
      'show_option': 'Zeige Option',
      'negative_payment_error':
          'Der Gutschriftsbetrag darf den Zahlungsbetrag nicht übersteigen',
      'view_changes': 'Änderungen anzeigen',
      'force_update': 'Aktualisierung erzwingen',
      'force_update_help':
          'Du nutzt die aktuellste Version, aber es könnten bereits neue Fehlerbehebungen zur Verfügung stehen.',
      'mark_paid_help': 'Verfolge ob Ausgabe bezahlt wurde',
      'should_be_invoiced': 'Sollte in Rechnung gestellt werden',
      'should_be_invoiced_help':
          'Ermögliche diese Ausgabe in Rechnung zu stellen',
      'add_documents_to_invoice_help': 'Dokumente sichtbar für den Kunde',
      'convert_currency_help': 'Wechselkurs festsetzen',
      'expense_settings': 'Ausgaben-Einstellungen',
      'clone_to_recurring': 'Duplizieren zu Wiederkehrend',
      'crypto': 'Cryptowährungen',
      'paypal': 'PayPal',
      'alipay': 'Alipay',
      'sofort': 'SOFORT-Überweisung',
      'apple_pay': 'Apple/Google Pay',
      'user_field': 'Benutzerfeld',
      'variables': 'Variablen',
      'show_password': 'Zeige Passwort',
      'hide_password': 'Verstecke Passwort',
      'copy_error': 'Kopier Fehler',
      'capture_card': 'Zahlungsmittel für die weitere Verwendung speichern',
      'auto_bill_enabled': 'Automatische Bezahlung aktivieren',
      'total_taxes': 'Gesamt Steuern',
      'line_taxes': 'Belegposition Steuer',
      'total_fields': 'Gesamt Felder',
      'stopped_recurring_invoice':
          'Wiederkehrende Rechnung erfolgreich gestoppt',
      'started_recurring_invoice':
          'Wiederkehrende Rechnung erfolgreich gestartet',
      'resumed_recurring_invoice':
          'Wiederkehrende Rechnung erfolgreich fortgesetzt',
      'gateway_refund': 'Zahlungsanbieter Rückerstattung',
      'gateway_refund_help':
          'Rückerstattung über das Zahlungs-Gateway abwickeln',
      'due_date_days': 'Fälligkeitsdatum',
      'paused': 'Pausiert',
      'mark_active': 'Markiere aktiv',
      'day_count': 'Tag :count',
      'first_day_of_the_month': 'Erster Tag des Monats',
      'last_day_of_the_month': 'Letzter Tag des Monats',
      'use_payment_terms': 'Benutze Zahlungsbedingung',
      'endless': 'Endlos',
      'next_send_date': 'Nächstes Versanddatum',
      'remaining_cycles': 'Verbleibende Durchgänge',
      'recurring_invoice': 'Wiederkehrende Rechnung',
      'recurring_invoices': 'Wiederkehrende Rechnungen',
      'new_recurring_invoice': 'Neue wiederkehrende Rechnung',
      'edit_recurring_invoice': 'Bearbeite wiederkehrende Rechnung',
      'created_recurring_invoice':
          'Wiederkehrende Rechnung erfolgreich erstellt',
      'updated_recurring_invoice':
          'Wiederkehrende Rechnung erfolgreich aktualisiert',
      'archived_recurring_invoice':
          'Wiederkehrende Rechnung erfolgreich archiviert',
      'deleted_recurring_invoice':
          'Wiederkehrende Rechnung erfolgreich gelöscht',
      'removed_recurring_invoice':
          'Wiederkehrende Rechnung erfolgreich entfernt',
      'restored_recurring_invoice':
          'Wiederkehrende Rechnung erfolgreich wiederhergestellt',
      'archived_recurring_invoices':
          ':value Wiederkehrende Rechnung erfolgreich archiviert',
      'deleted_recurring_invoices':
          ':value Wiederkehrende Rechnungen erfolgreich gelöscht',
      'restored_recurring_invoices':
          ':value Wiederkehrende Rechnungen erfolgreich wiederhergestellt',
      'search_recurring_invoice': 'Suche 1 wiederkehrende Rechnung',
      'search_recurring_invoices': 'Suche :count Wiederkehrende Rechnungen',
      'send_date': 'Versanddatum',
      'auto_bill_on': 'Automatische Rechnungsstellung zum',
      'minimum_under_payment_amount': 'Minimaler Unterzahlungsbetrag',
      'profit': 'Profit',
      'line_item': 'Posten',
      'allow_over_payment': 'Überbezahlung erlauben',
      'allow_over_payment_help':
          'Überzahlungen zulassen, beispielsweise Trinkgelder',
      'allow_under_payment': 'Unterbezahlung erlauben',
      'allow_under_payment_help': 'Teilzahlungen zulassen',
      'test_mode': 'Test Modus',
      'opened': 'Geöffnet',
      'payment_reconciliation_failure': 'Fehler bei Kontenabstimmung',
      'payment_reconciliation_success': 'Kontenabstimmung erfolgreich',
      'gateway_success': 'Zahlungsanbieter erfolgreich',
      'gateway_failure': 'Zahlungsanbieter Fehler',
      'gateway_error': 'Zahlungsanbieter Fehler',
      'email_send': 'E-Mail gesendet',
      'email_retry_queue': 'E-Mail Wiederholungswarteschlange',
      'failure': 'Fehler',
      'quota_exceeded': 'Quota erreicht',
      'upstream_failure': 'Upstream Fehler',
      'system_logs': 'System-Log',
      'view_portal': 'Portal anzeigen',
      'copy_link': 'Link kopieren',
      'token_billing': 'Kreditkarte merken',
      'welcome_to_invoice_ninja': 'Willkommen bei Invoice Ninja',
      'always': 'Immer',
      'optin': 'Opt-In',
      'optout': 'Opt-Out',
      'label': 'Label',
      'client_number': 'Kundennummer',
      'auto_convert': 'Automatisch konvertieren',
      'company_name': 'Firmenname',
      'reminder1_sent': 'Mahnung Nr. 1 verschickt',
      'reminder2_sent': 'Mahnung Nr. 2 verschickt',
      'reminder3_sent': 'Mahnung Nr. 3 verschickt',
      'reminder_last_sent': 'Letzte Mahnung verschickt',
      'pdf_page_info': 'Seite :current von :total',
      'emailed_invoices': 'Rechnungen erfolgreich versendet',
      'emailed_quotes': 'Angebote erfolgreich versendet',
      'emailed_credits': 'Gutschriften erfolgreich per E-Mail versendet',
      'gateway': 'Provider',
      'view_in_stripe': 'In Stripe anzeigen',
      'rows_per_page': 'Einträge pro Seite',
      'hours': 'Stunden',
      'statement': 'Bericht',
      'taxes': 'Steuern',
      'surcharge': 'Gebühr',
      'apply_payment': 'Zahlungen anwenden',
      'apply_credit': 'Gutschrift anwenden',
      'apply': 'Anwenden',
      'unapplied': 'unangewendet',
      'select_label': 'Bezeichnung wählen',
      'custom_labels': 'Eigene Beschriftungen',
      'record_type': 'Eintragstyp',
      'record_name': 'Eintragsname',
      'file_type': 'Dateityp',
      'height': 'Höhe',
      'width': 'Breite',
      'to': 'An',
      'health_check': 'Systemprüfung',
      'payment_type_id': 'Zahlungsart',
      'last_login_at': 'Letzter Login',
      'company_key': 'Firmen Schlüssel',
      'storefront': 'Storefront',
      'storefront_help':
          'Drittanbieter Applikationen erlauben Rechnungen zu erstellen',
      'client_created': 'Kunde wurde erstellt',
      'online_payment_email': 'E-Mail bei Online-Zahlung',
      'manual_payment_email': 'E-Mail bei manueller Zahlung',
      'completed': 'Abgeschlossen',
      'gross': 'Gesamtbetrag',
      'net_amount': 'Netto Betrag',
      'net_balance': 'Netto Betrag',
      'client_settings': 'Kunden-Einstellungen',
      'selected_invoices': 'Ausgewählte Rechnungen',
      'selected_payments': 'Ausgewählte Zahlungen',
      'selected_quotes': 'Ausgewählte Angebote',
      'selected_tasks': 'Ausgewählte Aufgaben',
      'selected_expenses': 'Ausgewählte Ausgaben',
      'upcoming_invoices': 'Ausstehende Rechnungen',
      'past_due_invoices': 'Überfällige Rechnungen',
      'recent_payments': 'Kürzliche Zahlungen',
      'upcoming_quotes': 'Ausstehende Angebote',
      'expired_quotes': 'Abgelaufene Angebote',
      'create_client': 'Kunden erstellen',
      'create_invoice': 'Rechnung erstellen',
      'create_quote': 'Angebot erstellen',
      'create_payment': 'Zahlung erstellen',
      'create_vendor': 'Lieferanten erstellen',
      'update_quote': 'Angebot aktualisieren',
      'delete_quote': 'Angebot löschen',
      'update_invoice': 'Rechnung aktualisieren',
      'delete_invoice': 'Rechnung löschen',
      'update_client': 'Kunde aktualisieren',
      'delete_client': 'Kunde löschen',
      'delete_payment': 'Zahlung löschen',
      'update_vendor': 'Lieferant aktualisieren',
      'delete_vendor': 'Lieferant Löschen',
      'create_expense': 'Ausgabe erstellen',
      'update_expense': 'Ausgabe aktualisieren',
      'delete_expense': 'Ausgabe Löschen',
      'create_task': 'Aufgabe erstellen',
      'update_task': 'Aufgabe aktualisieren',
      'delete_task': 'Aufgabe löschen',
      'approve_quote': 'Angebot annehmen',
      'off': 'Aus',
      'when_paid': 'Bei Zahlung',
      'expires_on': 'Gültig bis',
      'free': 'Kostenlos',
      'plan': 'Tarif',
      'show_sidebar': 'Zeige Seitenmenü',
      'hide_sidebar': 'Verstecke Seitenmenu',
      'event_type': 'Ereignistyp',
      'target_url': 'Ziel',
      'copy': 'kopieren',
      'must_be_online':
          'Bitte starten Sie die App sobald Sie mit dem Internet verbunden sind',
      'crons_not_enabled': 'Die Crons müssen aktiviert werden',
      'api_webhooks': 'API Webhooks',
      'search_webhooks': 'Suche :count Webhooks',
      'search_webhook': 'Suche 1 Webhook',
      'webhook': 'Webhook',
      'webhooks': 'Webhooks',
      'new_webhook': 'Neuer Webhook',
      'edit_webhook': 'Webhook bearbeiten',
      'created_webhook': 'Webhook erfolgreich erstellt',
      'updated_webhook': 'Webhook erfolgreich aktualisiert',
      'archived_webhook': 'Webhook erfolgreich archiviert',
      'deleted_webhook': 'Webhook erfolgreich gelöscht',
      'removed_webhook': 'Webhook erfolgreich entfernt',
      'restored_webhook': 'Webhook erfolgreich wiederhergestellt',
      'archived_webhooks': ':value Webhooks erfolgreich archiviert',
      'deleted_webhooks': ':value Webhooks erfolgreich gelöscht',
      'removed_webhooks': ':value Webhooks erfolgreich entfernt',
      'restored_webhooks': ':value Webhooks erfolgreich wiederhergestellt',
      'api_tokens': 'API Token',
      'api_docs': 'API Doku',
      'search_tokens': 'Suche :count Token',
      'search_token': 'Suche 1 Token',
      'token': 'Token',
      'tokens': 'Token',
      'new_token': 'Neues Token',
      'edit_token': 'Token bearbeiten',
      'created_token': 'Token erfolgreich erstellt',
      'updated_token': 'Token erfolgreich aktualisiert',
      'archived_token': 'Token erfolgreich archiviert',
      'deleted_token': 'Token erfolgreich gelöscht',
      'removed_token': 'Token erfolgreich entfernt',
      'restored_token': 'Token erfolgreich wiederhergestellt',
      'archived_tokens': ':count Token erfolgreich archiviert',
      'deleted_tokens': ':count Token erfolgreich gelöscht',
      'restored_tokens': ':value Token erfolgreich wiederhergestellt',
      'client_registration': 'Kunden Registration',
      'client_registration_help':
          'Den Kunden ermöglichen, sich selbst im Portal zu registrieren.',
      'email_invoice': 'Rechnung versenden',
      'email_quote': 'Angebot per E-Mail senden',
      'email_credit': 'Gutschrift per E-Mail versenden',
      'email_payment': 'Sende Zahlungs-E-Mail',
      'client_email_not_set':
          'Es wurde noch keine E-Mail Adresse beim Kunden eingetragen.',
      'ledger': 'Hauptbuch',
      'view_pdf': 'Zeige PDF',
      'all_records': 'Alle Einträge',
      'owned_by_user': 'Eigentümer',
      'credit_remaining': 'Verbleibende Gutschrift',
      'contact_name': 'Name des Kontakts',
      'use_default': 'Benutze Standardwert',
      'reminder_endless': 'Endlose Reminder',
      'number_of_days': 'Anzahl Tage',
      'configure_payment_terms': 'Zahlungsbedingungen bearbeiten',
      'payment_term': 'Zahlungsbedingung',
      'new_payment_term': 'Neue Zahlungsbedingung',
      'edit_payment_term': 'Bearbeite Zahlungsbedingungen',
      'created_payment_term': 'Zahlungsbedingung erfolgreich erstellt',
      'updated_payment_term': 'Zahlungsbedingung erfolgreich aktualisiert',
      'archived_payment_term': 'Zahlungsbedingung erfolgreich archiviert',
      'deleted_payment_term': 'Zahlungsbedingung erfolgreich gelöscht',
      'removed_payment_term': 'Zahlungsbedingung erfolgreich entfernt',
      'restored_payment_term':
          'Zahlungsbedingungen erfolgreich wiederhergestellt',
      'archived_payment_terms':
          ':value Zahlungsbedingungen erfolgreich archiviert',
      'deleted_payment_terms':
          ':value Zahlungsbedingungen erfolgreich gelöscht',
      'restored_payment_terms':
          ':value Zahlungsbedingungen erfolgreich wiederhergestellt',
      'email_sign_in': 'Mit E-Mail anmelden',
      'change': 'Ändern',
      'change_to_mobile_layout': 'Möchten Sie zur mobilen Ansicht wechseln?',
      'change_to_desktop_layout': 'Möchten Sie zur Desktopansicht wechseln?',
      'send_from_gmail': 'Mit Gmail versenden',
      'reversed': 'Umgekehrt',
      'cancelled': 'Storniert',
      'credit_amount': 'Gutschriftsbetrag',
      'quote_amount': 'Angebotsbetrag',
      'hosted': 'Gehostet',
      'selfhosted': 'Selbstgehostet',
      'exclusive': 'Exklusive',
      'inclusive': 'Inklusive',
      'hide_menu': 'Menü ausblenden',
      'show_menu': 'Menü einblenden',
      'partially_refunded': 'Teilweise erstattet',
      'search_documents': 'Suche nach Dokumenten',
      'search_designs': 'Suche nach Designs',
      'search_invoices': 'Suche Rechnungen',
      'search_clients': 'Suche Kunden',
      'search_products': 'Suche Produkte',
      'search_quotes': 'Suche Angebote',
      'search_credits': 'Suche Gutschrift',
      'search_vendors': 'Suche Lieferanten',
      'search_users': 'Suche Benutzer',
      'search_tax_rates': 'Suche Steuersatz',
      'search_tasks': 'Suche Aufgaben',
      'search_settings': 'Such-Einstellungen',
      'search_projects': 'Suche nach Projekten',
      'search_expenses': 'Suche Ausgaben',
      'search_payments': 'Suche Zahlungen',
      'search_groups': 'Suche nach Gruppen',
      'search_company': 'Suche Firma',
      'search_document': 'Suche 1 Dokument',
      'search_design': 'Suche 1 Design',
      'search_invoice': 'Suche 1 Angebot',
      'search_client': 'Suche 1 Kunden',
      'search_product': 'Suche 1 Produkt',
      'search_quote': 'Suche 1 Angebot',
      'search_credit': 'Suche 1 Gutschrift',
      'search_vendor': 'Suche 1 Hersteller',
      'search_user': 'Suche 1 Benutzer',
      'search_tax_rate': 'Suche 1 Steuersatz',
      'search_task': 'Suche 1 Aufgabe',
      'search_project': 'Suche 1 Projekt',
      'search_expense': 'Suche 1 Ausgabe',
      'search_payment': 'Suche 1 Zahlung',
      'search_group': 'Suche 1 Gruppen',
      'refund_payment': 'Zahlung erstatten',
      'cancelled_invoice': 'Rechnung erfolgreich storniert',
      'cancelled_invoices': 'Rechnungen erfolgreich storniert',
      'reversed_invoice': 'Rechnung erfolgreich zurückgebucht',
      'reversed_invoices': 'Rechnungen erfolgreich zurückgebucht',
      'reverse': 'Rückbuchung',
      'full_name': 'Voller Name',
      'city_state_postal': 'Stadt/Bundesland/PLZ',
      'postal_city_state': 'PLZ/Stadt/Bundesland',
      'custom1': 'Benutzerdefiniert 1',
      'custom2': 'Benutzerdefiniert 2',
      'custom3': 'Benutzerdefiniert 3',
      'custom4': 'Benutzerdefiniert 3',
      'optional': 'optional',
      'license': 'Lizenz',
      'purge_data': 'Daten säubern',
      'purge_successful': 'Die Kontodaten wurden erfolgreich gelöscht',
      'purge_data_message':
          'Achtung: Alle Daten werden vollständig gelöscht. Dieser Vorgang kann nicht rückgängig gemacht werden.',
      'invoice_balance': 'Rechnungssaldo',
      'age_group_0': '0 - 30 Tage',
      'age_group_30': '30 - 60 Tage',
      'age_group_60': '60 - 90 Tage',
      'age_group_90': '90 - 120 Tage',
      'age_group_120': '120+ Tage',
      'refresh': 'Aktualisieren',
      'saved_design': 'Design erfolgreich gespeichert',
      'client_details': 'Kundeninformationen',
      'company_address': 'Firmenadresse',
      'invoice_details': 'Rechnungsdetails',
      'quote_details': 'Angebots-Details',
      'credit_details': 'Gutschrift Details',
      'product_columns': 'Produktspalten',
      'task_columns': 'Aufgabenspalten',
      'add_field': 'Feld hinzufügen',
      'all_events': 'Alle Ereignisse',
      'permissions': 'Berechtigungen',
      'none': 'Nichts',
      'owned': 'Eigentümer',
      'payment_success': 'Bezahlung erfolgreich',
      'payment_failure': 'Bezahlung fehlgeschlagen',
      'invoice_sent': ':count Rechnung versendet',
      'quote_sent': 'Angebot versendet',
      'credit_sent': 'Gutschrift gesendet',
      'invoice_viewed': 'Rechnung angesehen',
      'quote_viewed': 'Angebot angesehen',
      'credit_viewed': 'Gutschrift angesehen',
      'quote_approved': 'Angebot angenommen',
      'receive_all_notifications': 'Empfange alle Benachrichtigungen',
      'purchase_license': 'Lizenz kaufen',
      'apply_license': 'Lizenz anwenden',
      'cancel_account': 'Konto kündigen',
      'cancel_account_message':
          'Warnung: Diese Aktion wird Ihr Konto unwiderruflich löschen.',
      'delete_company': 'Firma löschen',
      'delete_company_message':
          'Achtung: Dadurch wird Ihre Firma unwiderruflich gelöscht. Es gibt kein Zurück.',
      'enabled_modules': 'Module aktivieren',
      'converted_quote': 'Angebot erfolgreichen konvertiert',
      'credit_design': 'Gutschrift Design',
      'includes': 'Beinhaltet',
      'header': 'Header-Code',
      'load_design': 'Designvorlage laden',
      'css_framework': 'CSS-Framework',
      'custom_designs': 'Benutzerdefinierte Designs',
      'designs': 'Designs',
      'new_design': 'Neues Design',
      'edit_design': 'Design bearbeiten',
      'created_design': 'Design erfolgreich erstellt',
      'updated_design': 'Design erfolgreich aktualisiert',
      'archived_design': 'Design erfolgreich archiviert',
      'deleted_design': 'Design erfolgreich gelöscht',
      'removed_design': 'Design erfolgreich entfernt',
      'restored_design': 'Design erfolgreich wiederhergestellt',
      'archived_designs': ':value Designs erfolgreich archiviert',
      'deleted_designs': ':value Designs erfolgreich gelöscht',
      'restored_designs': ':value Designs erfolgreich wiederhergestellt',
      'proposals': 'Vorschläge',
      'tickets': 'Tickets',
      'recurring_quotes': 'Wiederkehrende Angebote',
      'recurring_tasks': 'Wiederkehrende Aufgabe',
      'account_management': 'Kontoverwaltung',
      'credit_date': 'Gutschriftsdatum',
      'credit': 'Gutschrift',
      'credits': 'Gutschrift',
      'new_credit': 'Gutschrift eingeben',
      'edit_credit': 'Gutschrift bearbeiten',
      'created_credit': 'Gutschrift erfolgreich erstellt',
      'updated_credit': 'Gutschrift erfolgreich aktualisiert',
      'archived_credit': 'Gutschrift erfolgreich archiviert',
      'deleted_credit': 'Gutschrift erfolgreich gelöscht',
      'removed_credit': 'Gutschrift erfolgreich entfernt',
      'restored_credit': 'Gutschrift erfolgreich wiederhergestellt',
      'archived_credits': ':count Gutschriften erfolgreich archiviert',
      'deleted_credits': ':count Gutschriften erfolgreich gelöscht',
      'restored_credits': ':value Gutschrift erfolgreich wiederhergestellt',
      'current_version': 'Aktuelle Version',
      'latest_version': 'Neueste Version',
      'update_now': 'Jetzt aktualisieren',
      'a_new_version_is_available':
          'Eine neue Version der Webapp ist verfügbar.',
      'update_available': 'Update verfügbar',
      'app_updated': 'Update erfolgreich',
      'learn_more': 'Mehr erfahren',
      'integrations': 'Integrationen',
      'tracking_id': 'Sendungsnummer',
      'slack_webhook_url': 'Slack-Webhook-URL',
      'credit_footer': 'Gutschrift-Fußzeile',
      'credit_terms': 'Gutschrift Bedingungen',
      'new_company': 'Neues Konto',
      'added_company': 'Erfolgreich Firma hinzugefügt',
      'company1': 'Benutzerdefinierte Firma 1',
      'company2': 'Benutzerdefinierte Firma 2',
      'company3': 'Benutzerdefinierte Firma 3',
      'company4': 'Benutzerdefinierte Firma 4',
      'product1': 'Benutzerdefiniertes Produkt 1',
      'product2': 'Benutzerdefiniertes Produkt 2',
      'product3': 'Benutzerdefiniertes Produkt 3',
      'product4': 'Benutzerdefiniertes Produkt 4',
      'client1': 'Benutzerdefinierter Kunde 1',
      'client2': 'Benutzerdefinierter Kunde 2',
      'client3': 'Benutzerdefinierter Kunde 3',
      'client4': 'Benutzerdefinierter Kunde 4',
      'contact1': 'Benutzerdefinierter Kontakt 1',
      'contact2': 'Benutzerdefinierter Kontakt 2',
      'contact3': 'Benutzerdefinierter Kontakt 3',
      'contact4': 'Benutzerdefinierter Kontakt 4',
      'task1': 'Benutzerdefinierte Aufgabe 1',
      'task2': 'Benutzerdefinierte Aufgabe 2',
      'task3': 'Benutzerdefinierte Aufgabe 3',
      'task4': 'Benutzerdefinierte Aufgabe 4',
      'project1': 'Benutzerdefiniertes Projekt 1',
      'project2': 'Benutzerdefiniertes Projekt 2',
      'project3': 'Benutzerdefiniertes Projekt 3',
      'project4': 'Benutzerdefiniertes Projekt 4',
      'expense1': 'Benutzerdefinierte Ausgabe 1',
      'expense2': 'Benutzerdefinierte Ausgabe 2',
      'expense3': 'Benutzerdefinierte Ausgabe 3',
      'expense4': 'Benutzerdefinierte Ausgabe 4',
      'vendor1': 'Benutzerdefinierter Lieferant 1',
      'vendor2': 'Benutzerdefinierter Lieferant 2',
      'vendor3': 'Benutzerdefinierter Lieferant 3',
      'vendor4': 'Benutzerdefinierter Lieferant 4',
      'invoice1': 'Benutzerdefinierte Rechnung 1',
      'invoice2': 'Benutzerdefinierte Rechnung 2',
      'invoice3': 'Benutzerdefinierte Rechnung 3',
      'invoice4': 'Benutzerdefinierte Rechnung 4',
      'payment1': 'Benutzerdefinierte Zahlung 1',
      'payment2': 'Benutzerdefinierte Zahlung 2',
      'payment3': 'Benutzerdefinierte Zahlung 3',
      'payment4': 'Benutzerdefinierte Zahlung 4',
      'surcharge1': 'Benutzerdefinierter Zuschlag 1',
      'surcharge2': 'Benutzerdefinierter Zuschlag 2',
      'surcharge3': 'Benutzerdefinierter Zuschlag 3',
      'surcharge4': 'Benutzerdefinierter Zuschlag 4',
      'group1': 'Benutzerdefinierte Gruppe 1',
      'group2': 'Benutzerdefinierte Gruppe 2',
      'group3': 'Benutzerdefinierte Gruppe 3',
      'group4': 'Benutzerdefinierte Gruppe 4',
      'reset': 'Zurücksetzen',
      'number': 'Nummer',
      'export': 'Exportieren',
      'chart': 'Diagramm',
      'count': 'Anzahl',
      'totals': 'Summe',
      'blank': 'Leer',
      'day': 'Tag',
      'month': 'Monat',
      'year': 'Jahr',
      'subgroup': 'Untergruppe',
      'is_active': 'Ist aktiv',
      'group_by': 'Gruppieren nach',
      'credit_balance': 'Gutschriftsstand',
      'contact_last_login': 'Letzter Login des Kontakts',
      'contact_full_name': 'Vollständiger Name des Kontakts',
      'contact_phone': 'Telefonnummer des Kontakts',
      'contact_custom_value1': 'Kontakt Benutzerdefinierter Wert 1',
      'contact_custom_value2': 'Kontakt Benutzerdefinierter Wert 2',
      'contact_custom_value3': 'Kontakt Benutzerdefinierter Wert 3',
      'contact_custom_value4': 'Kontakt Benutzerdefinierter Wert 4',
      'shipping_address1': 'Strasse Versandanschrift',
      'shipping_address2': 'Versand Adresszusatz',
      'shipping_city': 'Stadt Versandanschrift',
      'shipping_state': 'Versand Bundesland',
      'shipping_postal_code': 'Postleitzahl Versandanschrift',
      'shipping_country': 'Lieferungsland',
      'billing_address1': 'Strasse Rechnungsanschrift',
      'billing_address2': 'Rechnung Adresszusatz',
      'billing_city': 'Stadt Rechnungsanschrift',
      'billing_state': 'Rechnung Bundesland',
      'billing_postal_code': 'Postleitzahl Rechnungsanschrift',
      'billing_country': 'Rechnungsland',
      'client_id': 'Kundennummer',
      'assigned_to': 'Zugewiesen an',
      'created_by': 'Erstellt von :name',
      'assigned_to_id': 'Zugewiesen zur ID',
      'created_by_id': 'Erstellt von ID',
      'add_column': 'Spalte hinzufügen',
      'edit_columns': 'Spalten bearbeiten',
      'columns': 'Spalten',
      'aging': 'Versendet',
      'profit_and_loss': 'Gewinn und Verlust',
      'reports': 'Berichte',
      'report': 'Bericht',
      'add_company': 'Konto hinzufügen',
      'unpaid_invoice': 'Unbezahlte Rechnung',
      'paid_invoice': 'Bezahlte Rechnung',
      'unapproved_quote': 'Nicht genehmigtes Angebot',
      'help': 'Hilfe',
      'refund': 'Erstattung',
      'refund_date': 'Erstattungsdatum',
      'filtered_by': 'Gefiltert nach',
      'contact_email': 'E-Mail-Adresse des Kontakts',
      'multiselect': 'Mehrfachauswahl',
      'entity_state': 'Status',
      'verify_password': 'Passwort überprüfen',
      'applied': 'Angewendet',
      'include_recent_errors': 'Kürzliche Fehler aus den Logs einfügen',
      'your_message_has_been_received':
          'Wir haben ihre Nachricht erhalten und bemühen uns schnellstmöglich zu antworten.',
      'message': 'Nachricht',
      'from': 'Von',
      'show_product_details': 'Produktdetails anzeigen',
      'show_product_details_help':
          'Beschreibung und Kosten in die Produkt-Dropdown-Liste einfügen',
      'pdf_min_requirements': 'Der PDF-Renderer benötigt :version',
      'adjust_fee_percent': 'Anpassungszuschlag Prozent',
      'adjust_fee_percent_help': 'Gebühren Prozentsatz an das Konto anpassen',
      'configure_settings': 'Einstellungen bearbeiten',
      'support_forum': 'Support-Foren',
      'about': 'Über',
      'documentation': 'Dokumentation',
      'contact_us': 'Kontaktieren Sie uns',
      'subtotal': 'Zwischensumme',
      'line_total': 'Summe',
      'item': 'Artikel',
      'credit_email': 'Gutschrift E-Mail',
      'iframe_url': 'iFrame-URL',
      'domain_url': 'Domain-URL',
      'password_is_too_short': 'Das Passwort ist zu kurz',
      'password_is_too_easy':
          'Das Passwort muss einen Großbuchstaben und eine Nummer enthalten',
      'client_portal_tasks': 'Kundenportal-Aufgaben',
      'client_portal_dashboard': 'Kundenportal-Übersicht',
      'please_enter_a_value': 'Bitte einen Wert eingeben',
      'deleted_logo': 'Logo erfolgreich gelöscht',
      'yes': 'Ja',
      'no': 'Nein',
      'generate_number': 'Nummer generieren',
      'when_saved': 'Wenn gespeichert',
      'when_sent': 'Wenn gesendet',
      'select_company': 'Firma auswählen',
      'float': 'Schwebend',
      'collapse': 'Einklappen',
      'show_or_hide': 'Anzeigen/verstecken',
      'menu_sidebar': 'Menüleiste',
      'history_sidebar': 'Verlaufs-Seitenleiste',
      'tablet': 'Tablet',
      'mobile': 'Mobil',
      'desktop': 'Desktop',
      'layout': 'Layout',
      'view': 'Ansehen',
      'module': 'Modul',
      'first_custom': 'Erste benutzerdefinierte',
      'second_custom': 'Zweite benutzerdefinierte',
      'third_custom': 'Dritte benutzerdefinierte',
      'show_cost': 'Kosten anzeigen',
      'show_product_cost': 'Produktkosten anzeigen',
      'show_cost_help':
          'Feld für Einkaufspreis anzeigen, um Gewinnspanne zu verfolgen',
      'show_product_quantity': 'Produktanzahl anzeigen',
      'show_product_quantity_help':
          'Zeigen ein Mengenangabe Feld, sonst den Standardwert 1',
      'show_invoice_quantity': 'Rechnungsanzahl anzeigen',
      'show_invoice_quantity_help':
          'Zeige ein Rechnungsposten Anzahlfeld, sonst den Standardwert 1',
      'show_product_discount': 'Produktermäßigung anzeigen',
      'show_product_discount_help': 'Zeige Rabattfeld in Belegposition',
      'default_quantity': 'Standardanzahl',
      'default_quantity_help':
          'Setze den Rechnungsposten automatisch auf Anzahl 1',
      'one_tax_rate': 'Ein Steuersatz',
      'two_tax_rates': 'Zwei Steuersätze',
      'three_tax_rates': 'Drei Steuersätze',
      'default_tax_rate': 'Standard-Steuersatz',
      'user': 'Benutzer',
      'invoice_tax': 'Rechnungssteuer',
      'line_item_tax': 'Belegpositions-Steuer',
      'inclusive_taxes': 'Inklusive Steuern',
      'invoice_tax_rates': 'Rechnungs-Steuersätze',
      'item_tax_rates': 'Element-Steuersätze',
      'no_client_selected': 'Bitte wählen Sie einen Kunden',
      'configure_rates': 'Steuersätze bearbeiten',
      'configure_gateways': 'Zahlungsanbieter bearbeiten',
      'tax_settings': 'Steuer-Einstellungen',
      'tax_settings_rates': 'Steuersätze',
      'accent_color': 'Akzent-Farbe',
      'switch': 'Switch',
      'comma_sparated_list': 'Komma-separierte Liste',
      'options': 'Optionen',
      'single_line_text': 'Einzeiliger Text',
      'multi_line_text': 'Mehrzeiliger Text',
      'dropdown': 'Dropdown',
      'field_type': 'Feldtyp',
      'recover_password_email_sent':
          'Eine Passwort-Wiederherstellungs-Mail wurde versendet',
      'submit': 'Senden',
      'recover_password': 'Passwort wiederherstellen',
      'late_fees': 'Verspätungszuschläge',
      'credit_number': 'Gutschriftnummer',
      'payment_number': 'Zahlungsnummer',
      'late_fee_amount': 'Höhe des Verspätungszuschlags',
      'late_fee_percent': 'Verspätungszuschlag Prozent',
      'before_due_date': 'Vor dem Fälligkeitsdatum',
      'after_due_date': 'Nach dem Fälligkeitsdatum',
      'after_invoice_date': 'Nach dem Rechnungsdatum',
      'days': 'Tage',
      'invoice_email': 'Rechnungsmail',
      'payment_email': 'Zahlungsmail',
      'partial_payment': 'Teilzahlung',
      'payment_partial': 'Teilzahlung',
      'partial_payment_email': 'Teilzahlungsmail',
      'quote_email': 'Angebotsmail',
      'endless_reminder': 'Endlose Erinnnerung',
      'filtered_by_user': 'Gefiltert nach Benutzer',
      'administrator': 'Administrator',
      'administrator_help':
          'Dem Benutzer erlauben, andere Benutzer zu administrieren, Einstellungen zu ändern und alle Einträge zu bearbeiten',
      'user_management': 'Benutzerverwaltung',
      'users': 'Benutzer',
      'new_user': 'Neuer Benutzer',
      'edit_user': 'Benutzer bearbeiten',
      'created_user': 'Benutzer erfolgreich erstellt',
      'updated_user': 'Benutzer erfolgreich aktualisiert',
      'archived_user': 'Benutzer erfolgreich archiviert',
      'deleted_user': 'Benutzer erfolgreich gelöscht',
      'removed_user': 'Benutzer erfolgreich entfernt',
      'restored_user': 'Benutzer erfolgreich wiederhergestellt',
      'archived_users': ':value Benutzer erfolgreich archiviert',
      'deleted_users': ':value Benutzer erfolgreich gelöscht',
      'removed_users': ':value Benutzer erfolgreich entfernt',
      'restored_users': ':value Benutzer erfolgreich wiederhergestellt',
      'general_settings': 'Allgemeine Einstellungen',
      'invoice_options': 'Rechnungsoptionen',
      'hide_paid_to_date': '\'Bereits gezahlt\' ausblenden',
      'hide_paid_to_date_help':
          '\'Bereits gezahlt\' nur anzeigen, wenn eine Zahlung eingegangen ist.',
      'invoice_embed_documents': 'Bilder/Dokumente einbetten',
      'invoice_embed_documents_help':
          'Füge angehängte Bilder/PDFs der Rechnung bei.',
      'all_pages_header': 'Zeige Kopf auf',
      'all_pages_footer': 'Zeige Fußzeilen auf',
      'first_page': 'Erste Seite',
      'all_pages': 'Alle Seiten',
      'last_page': 'Letzte Seite',
      'primary_font': 'Primäre Schriftart',
      'secondary_font': 'Sekundäre Schriftart',
      'primary_color': 'Primärfarbe',
      'secondary_color': 'Sekundärfarbe',
      'page_size': 'Seitengröße',
      'font_size': 'Schriftgröße',
      'quote_design': 'Angebots-Layout',
      'invoice_fields': 'Rechnungsfelder',
      'product_fields': 'Produktfelder',
      'invoice_terms': 'Rechnungsbedingungen',
      'invoice_footer': 'Rechnungsfußzeile',
      'quote_terms': 'Angebotsbedingungen',
      'quote_footer': 'Angebots-Fußzeile',
      'auto_email_invoice': 'Automatischer E-Mail-Versand',
      'auto_email_invoice_help':
          'Senden Sie automatisch wiederkehrende Rechnungen per E-Mail, wenn sie erstellt wurden.',
      'auto_archive_quote': 'Automatisches Archiv',
      'auto_archive_quote_help':
          'Archivieren Sie Angebote automatisch, wenn sie in Rechnungen umgewandelt werden.',
      'auto_convert_quote': 'Automatisch konvertieren',
      'auto_convert_quote_help':
          'Wandeln Sie ein Angebot automatisch in eine Rechnung um, wenn es angenommen wurde.',
      'workflow_settings': 'Workflow-Einstellungen',
      'freq_daily': 'Täglich',
      'freq_weekly': 'Wöchentlich',
      'freq_two_weeks': 'Zweiwöchentlich',
      'freq_four_weeks': 'Vierwöchentlich',
      'freq_monthly': 'Monatlich',
      'freq_two_months': 'Zwei Monate',
      'freq_three_months': 'Dreimonatlich',
      'freq_four_months': 'Vier Monate',
      'freq_six_months': 'Halbjährlich',
      'freq_annually': 'Jährlich',
      'freq_two_years': 'Zwei Jahre',
      'freq_three_years': 'Drei Jahre',
      'never': 'Niemals',
      'company': 'Firma',
      'generated_numbers': 'Generierte Nummern',
      'charge_taxes': 'Steuern erheben',
      'next_reset': 'Nächster Reset',
      'reset_counter': 'Zähler-Reset',
      'recurring_prefix': 'Wiederkehrender Präfix',
      'number_padding': 'Nummernabstand',
      'general': 'Allgemein',
      'surcharge_field': 'Zuschlagsfeld',
      'company_field': 'Firmenfeld',
      'company_value': 'Firmenwert',
      'credit_field': 'Kredit-Feld',
      'invoice_field': 'Rechnungsfeld',
      'invoice_surcharge': 'Rechnungsgebühr',
      'client_field': 'Kundenfeld',
      'product_field': 'Produktfeld',
      'payment_field': 'Zahlungsfeld',
      'contact_field': 'Kontaktfeld',
      'vendor_field': 'Lieferantenfeld',
      'expense_field': 'Ausgabenfeld',
      'project_field': 'Projektfeld',
      'task_field': 'Aufgabenfeld',
      'group_field': 'Gruppen-Feld',
      'number_counter': 'Nummernzähler',
      'prefix': 'Präfix',
      'number_pattern': 'Nummernschema',
      'messages': 'Nachrichten',
      'custom_css': 'Benutzerdefiniertes CSS',
      'custom_javascript': 'Benutzerdefiniertes JavaScript',
      'signature_on_pdf': 'Auf PDF anzeigen',
      'signature_on_pdf_help':
          'Unterschrift des Kunden auf dem Angebots/Rechnungs PDF anzeigen.',
      'show_accept_invoice_terms': 'Checkbox für Rechnungsbedingungen',
      'show_accept_invoice_terms_help':
          'Die Bestätigung der Rechnungsbedingungen vom Kunden fordern.',
      'show_accept_quote_terms': 'Checkbox für Angebotsbedingungen',
      'show_accept_quote_terms_help':
          'Die Bestätigung der Angebotsbedingungen vom Kunden fordern.',
      'require_invoice_signature': 'Rechnungsunterschrift',
      'require_invoice_signature_help':
          'Die Unterschrift des Kunden bei Rechnungen fordern.',
      'require_quote_signature': 'Angebotsunterschrift',
      'enable_portal_password': 'Rechnungen mit Passwort schützen',
      'enable_portal_password_help':
          'Erlaubt Ihnen ein Passwort für jeden Kontakt zu erstellen. Wenn ein Passwort erstellt wurde, muss der Kunde dieses eingeben, bevor er eine Rechnung ansehen darf.',
      'authorization': 'Genehmigung',
      'subdomain': 'Subdomäne',
      'domain': 'Domäne',
      'portal_mode': 'Portalmodus',
      'email_signature': 'Mit freundlichen Grüßen',
      'enable_email_markup_help':
          'Machen Sie es einfacher für Ihre Kunden zu bezahlen, indem Sie schema.org Markup zu Ihren E-Mails hinzufügen.',
      'plain': 'Einfach',
      'light': 'Hell',
      'dark': 'Dunkel',
      'email_design': 'E-Mail-Design',
      'attach_pdf': 'PDF anhängen',
      'attach_documents': 'Dokumente anhängen',
      'attach_ubl': 'UBL/E-Rechnung anhängen',
      'email_style': 'E-Mail-Stil',
      'enable_email_markup': 'Markup erlauben',
      'reply_to_email': 'Antwort-E-Mail-Adresse',
      'reply_to_name': 'Name der Antwortadresse',
      'bcc_email': 'BCC E-Mail',
      'processed': 'Verarbeitet',
      'credit_card': 'Kreditkarte',
      'bank_transfer': 'Überweisung',
      'priority': 'Priorität',
      'fee_amount': 'Zuschlag Betrag',
      'fee_percent': 'Zuschlag Prozent',
      'fee_cap': 'Gebührenobergrenze',
      'limits_and_fees': 'Grenzwerte/Gebühren',
      'enable_min': 'Min aktivieren',
      'enable_max': 'Max aktivieren',
      'min_limit': 'Min: :min',
      'max_limit': 'Max: :max',
      'min': 'Min',
      'max': 'Max',
      'accepted_card_logos': 'Logos der akzeptierten Kreditkarten',
      'credentials': 'Zugangsdaten',
      'update_address': 'Adresse aktualisieren',
      'update_address_help':
          'Kundenadresse mit den gemachten Angaben aktualisieren',
      'rate': 'Stundensatz',
      'tax_rate': 'Steuersatz',
      'new_tax_rate': 'Neuer Steuersatz',
      'edit_tax_rate': 'Steuersatz bearbeiten',
      'created_tax_rate': 'Steuersatz erstellt',
      'updated_tax_rate': 'Steuersatz aktualisiert',
      'archived_tax_rate': 'Steuersatz archiviert',
      'deleted_tax_rate': 'Steuersatz erfolgreich gelöscht',
      'restored_tax_rate': 'Steuersatz erfolgreich wiederhergestellt',
      'archived_tax_rates': ':value Steuersätze erfolgreich archiviert',
      'deleted_tax_rates': ':value Steuersätze erfolgreich gelöscht',
      'restored_tax_rates': ':value Steuersätze erfolgreich wiederhergestellt',
      'fill_products': 'Produkte automatisch ausfüllen',
      'fill_products_help':
          'Beim Auswählen eines Produktes werden automatisch Beschreibung und Kosten ausgefüllt',
      'update_products': 'Produkte automatisch aktualisieren',
      'update_products_help':
          'Beim Aktualisieren einer Rechnung werden die Produkte automatisch aktualisiert',
      'convert_products': 'Produkte konvertieren',
      'convert_products_help':
          'Produktpreise automatisch in die Währung des Kunden konvertieren',
      'fees': 'Gebühren',
      'limits': 'Grenzwerte',
      'provider': 'Anbieter',
      'company_gateway': 'Zahlungs-Gateway',
      'company_gateways': 'Zahlungs-Gateways',
      'new_company_gateway': 'Neues Gateway',
      'edit_company_gateway': 'Gateway bearbeiten',
      'created_company_gateway': 'Gateway erfolgreich erstellt',
      'updated_company_gateway': 'Gateway erfolgreich aktualisiert',
      'archived_company_gateway': 'Gateway erfolgreich archiviert',
      'deleted_company_gateway': 'Gateway erfolgreich gelöscht',
      'restored_company_gateway': 'Gateway erfolgreich wiederhergestellt',
      'archived_company_gateways':
          ':value Zahlungsanbieter erfolgreich archiviert',
      'deleted_company_gateways':
          ':value Zahlungsanbieter erfolgreich gelöscht',
      'restored_company_gateways':
          ':value Zahlungsanbieter erfolgreich wiederhergestellt',
      'continue_editing': 'Weiterbearbeiten',
      'discard_changes': 'Änderungen verwerfen',
      'default_value': 'Standardwert',
      'disabled': 'Deaktiviert',
      'currency_format': 'Währungsformat',
      'first_day_of_the_week': 'Erster Tag der Woche',
      'first_month_of_the_year': 'Erster Monat des Jahres',
      'sunday': 'Sonntag',
      'monday': 'Montag',
      'tuesday': 'Dienstag',
      'wednesday': 'Mittwoch',
      'thursday': 'Donnerstag',
      'friday': 'Freitag',
      'saturday': 'Samstag',
      'january': 'Januar',
      'february': 'Februar',
      'march': 'März',
      'april': 'April',
      'may': 'Mai',
      'june': 'Juni',
      'july': 'Juli',
      'august': 'August',
      'september': 'September',
      'october': 'Oktober',
      'november': 'November',
      'december': 'Dezember',
      'symbol': 'Symbol',
      'ocde': 'Code',
      'date_format': 'Datumsformat',
      'datetime_format': 'Datums-/Zeitformat',
      'military_time': '24-Stunden-Zeit',
      'military_time_help': '24-Stunden-Anzeige',
      'send_reminders': 'Mahnung senden',
      'timezone': 'Zeitzone',
      'filtered_by_project': 'Nach Projekt filtern',
      'filtered_by_group': 'Gefiltert nach Gruppe',
      'filtered_by_invoice': 'Gefiltert nach Rechnung',
      'filtered_by_client': 'Gefiltert nach Kunde',
      'filtered_by_vendor': 'Gefiltert nach Lieferant',
      'group_settings': 'Gruppeneinstellungen',
      'group': 'Gruppe',
      'groups': 'Gruppen',
      'new_group': 'Neue Gruppe',
      'edit_group': 'Gruppe bearbeiten',
      'created_group': 'Gruppe erfolgreich erstellt',
      'updated_group': 'Gruppe erfolgreich aktualisiert',
      'archived_groups': ':value Gruppen erfolgreich archiviert',
      'deleted_groups': ':value Gruppen erfolgreich gelöscht',
      'restored_groups': ':value Gruppen erfolgreich wiederhergestellt',
      'archived_group': 'Gruppe erfolgreich archiviert',
      'deleted_group': 'Gruppe erfolgreich gelöscht',
      'restored_group': 'Gruppe erfolgreich wiederhergestellt',
      'upload_logo': 'Laden Sie Ihr Firmenlogo hoch',
      'uploaded_logo': 'Logo erfolgreich hochgeladen',
      'logo': 'Logo',
      'saved_settings': 'Einstellungen erfolgreich gespeichert',
      'product_settings': 'Produkt-Einstellungen',
      'device_settings': 'Geräte-Einstellungen',
      'defaults': 'Standards',
      'basic_settings': 'Allgemeine Einstellungen',
      'advanced_settings': 'Erweiterte Einstellungen',
      'company_details': 'Firmendaten',
      'user_details': 'Benutzerdaten',
      'localization': 'Lokalisierung',
      'online_payments': 'Online-Zahlungen',
      'tax_rates': 'Steuersätze',
      'notifications': 'Benachrichtigungen',
      'import_export': 'Import/Export',
      'custom_fields': 'Benutzerdefinierte Felder',
      'invoice_design': 'Rechnungsdesign',
      'buy_now_buttons': '\'Kaufe jetzt\'-Buttons',
      'email_settings': 'E-Mail-Einstellungen',
      'templates_and_reminders': 'Vorlagen & Mahnungen',
      'credit_cards_and_banks': 'Kreditkarten & Banken',
      'data_visualizations': 'Datenvisualisierungen',
      'price': 'Preis',
      'email_sign_up': 'E-Mail-Registrierung',
      'google_sign_up': 'Registrierung via Google',
      'thank_you_for_your_purchase': 'Vielen Dank für Ihren Kauf!',
      'redeem': 'Einlösen',
      'back': 'Zurück',
      'past_purchases': 'Vergangene Käufe',
      'annual_subscription': 'Jahres-Abonnement',
      'pro_plan': 'Pro-Tarif',
      'enterprise_plan': 'Enterprise-Tarif',
      'count_users': ':count Benutzer',
      'upgrade': 'Upgrade',
      'please_enter_a_first_name': 'Bitte geben Sie einen Vornamen ein',
      'please_enter_a_last_name': 'Bitte geben Sie einen Nachnamen ein',
      'please_agree_to_terms_and_privacy':
          'Bitte stimmen Sie den Nutzungsbedingungen und der Datenschutzerklärung zu, um ein Konto zu erstellen.',
      'i_agree_to_the': 'Ich stimme den',
      'terms_of_service': 'Service-Bedingungen',
      'privacy_policy': 'Datenschutzerklärung',
      'sign_up': 'Anmeldung',
      'account_login': 'Konto Login',
      'view_website': 'Webseite anschauen',
      'create_account': 'Konto erstellen',
      'email_login': 'E-Mail-Anmeldung',
      'create_new': 'Neu...',
      'no_record_selected': 'Kein Eintrag ausgewählt',
      'error_unsaved_changes':
          'Bitte speichern oder verwerfen Sie Ihre Änderungen',
      'download': 'Herunterladen',
      'requires_an_enterprise_plan': 'Erfordert einen Enterprise-Tarif',
      'take_picture': 'Bild aufnehmen',
      'upload_files': 'Dateien hochladen',
      'document': 'Dokument',
      'documents': 'Dokumente',
      'new_document': 'Neues Dokument',
      'edit_document': 'Dokument bearbeiten',
      'uploaded_document': 'Dokument erfolgreich hochgeladen',
      'updated_document': 'Dokument erfolgreich aktualisiert',
      'archived_document': 'Dokument erfolgreich archiviert',
      'deleted_document': 'Dokument erfolgreich gelöscht',
      'restored_document': 'Dokument erfolgreich wiederhergestellt',
      'archived_documents': ':value Dokumente erfolgreich archiviert',
      'deleted_documents': ':value Dokumente erfolgreich gelöscht',
      'restored_documents': ':value Dokumente erfolgreich wiederhergestellt',
      'no_history': 'Kein Verlauf',
      'expense_date': 'Ausgabendatum',
      'pending': 'Ausstehend',
      'expense_status_1': 'Aufgezeichnet',
      'expense_status_2': 'Ausstehend',
      'expense_status_3': 'Fakturiert',
      'converted': 'Umgewandelt',
      'add_documents_to_invoice': 'Fügen Sie Dokumente zur Rechnung hinzu',
      'exchange_rate': 'Wechselkurs',
      'convert_currency': 'Währung umrechnen',
      'mark_paid': 'Als bezahlt markieren',
      'category': 'Kategorie',
      'address': 'Adresse',
      'new_vendor': 'Neuer Lieferant',
      'created_vendor': 'Lieferant erfolgreich erstellt',
      'updated_vendor': 'Lieferant erfolgreich aktualisiert',
      'archived_vendor': 'Lieferant erfolgreich archiviert',
      'deleted_vendor': 'Lieferant erfolgreich gelöscht',
      'restored_vendor': 'Lieferant erfolgreich wiederhergestellt',
      'archived_vendors': ':count Lieferanten erfolgreich archiviert',
      'deleted_vendors': ':count Lieferanten erfolgreich gelöscht',
      'restored_vendors': ':value Lieferanten erfolgreich wiederhergestellt',
      'new_expense': 'Ausgabe eingeben',
      'created_expense': 'Ausgabe erfolgreich erstellt',
      'updated_expense': 'Ausgabe erfolgreich aktualisiert',
      'archived_expense': 'Ausgabe erfolgreich archiviert',
      'deleted_expense': 'Ausgabe erfolgreich gelöscht',
      'restored_expense': 'Ausgabe erfolgreich wiederhergestellt',
      'archived_expenses': 'Ausgaben erfolgreich archiviert',
      'deleted_expenses': 'Ausgaben erfolgreich gelöscht',
      'restored_expenses': ':value Ausgaben erfolgreich wiederhergestellt',
      'copy_shipping': 'Versand kopieren',
      'copy_billing': 'Zahlung kopieren',
      'design': 'Design',
      'failed_to_find_record': 'Eintrag konnte nicht gefunden werden',
      'invoiced': 'In Rechnung gestellt',
      'logged': 'Protokolliert',
      'running': 'Läuft',
      'resume': 'Fortfahren',
      'task_errors': 'Bitte korrigieren Sie alle überlappenden Zeiten',
      'start': 'Starten',
      'stop': 'Anhalten',
      'started_task': 'Aufgabe erfolgreich gestartet',
      'stopped_task': 'Aufgabe erfolgreich angehalten',
      'resumed_task': 'Aufgabe fortgesetzt',
      'now': 'Jetzt',
      'auto_start_tasks': 'Aufgaben für den automatischen Start',
      'timer': 'Zeitmesser',
      'manual': 'Manuell',
      'budgeted': 'Budgetiert',
      'start_time': 'Startzeit',
      'end_time': 'Endzeit',
      'date': 'Datum',
      'times': 'Zeiten',
      'duration': 'Dauer',
      'new_task': 'Neue Aufgabe',
      'created_task': 'Aufgabe erfolgreich erstellt',
      'updated_task': 'Aufgabe erfolgreich aktualisiert',
      'archived_task': 'Aufgabe erfolgreich archiviert',
      'deleted_task': 'Aufgabe erfolgreich gelöscht',
      'restored_task': 'Aufgabe erfolgreich wiederhergestellt',
      'archived_tasks': ':count Aufgaben wurden erfolgreich archiviert',
      'deleted_tasks': ':count Aufgaben wurden erfolgreich gelöscht',
      'restored_tasks': ':value Aufgaben erfolgreich wiederhergestellt',
      'please_enter_a_name': 'Bitte geben Sie einen Namen ein',
      'budgeted_hours': 'Budgetierte Stunden',
      'created_project': 'Projekt erfolgreich erstellt',
      'updated_project': 'Projekt erfolgreich aktualisiert',
      'archived_project': 'Projekt erfolgreich archiviert',
      'deleted_project': 'Projekt erfolgreich gelöscht',
      'restored_project': 'Projekt erfolgreich wiederhergestellt',
      'archived_projects': 'Erfolgreich :count Projekte archiviert',
      'deleted_projects': 'Erfolgreich :count Projekte gelöscht',
      'restored_projects': ':value Projekte erfolgreich wiederhergestellt',
      'new_project': 'Neues Projekt',
      'thank_you_for_using_our_app': 'Vielen Dank, dass Sie unsere App nutzen!',
      'if_you_like_it': 'Wenn es dir gefällt, bitte',
      'click_here': 'hier klicken',
      'click_here_capital': 'Klicke hier',
      'to_rate_it': ', um es zu bewerten.',
      'average': 'Durchschnittlich',
      'unapproved': 'Nicht genehmigt',
      'authenticate_to_change_setting':
          'Bitte authentifizieren Sie sich, um diese Einstellung zu ändern.',
      'locked': 'Gesperrt',
      'authenticate': 'Authentifizieren',
      'please_authenticate': 'Bitte authentifizieren Sie sich',
      'biometric_authentication': 'Biometrische Authentifizierung',
      'footer': 'Footer-Code',
      'compare': 'Vergleiche',
      'hosted_login': 'Hosted Login',
      'selfhost_login': 'Selfhost Login',
      'google_sign_in': 'Anmeldung mit Google',
      'today': 'Heute',
      'custom_range': 'Benutzerdefinierter Bereich',
      'date_range': 'Datumsbereich',
      'current': 'Aktuell',
      'previous': 'Vorherige',
      'current_period': 'Aktuelle Periode',
      'comparison_period': 'Vergleichsperiode',
      'previous_period': 'Vorherige Periode',
      'previous_year': 'Vorjahr',
      'compare_to': 'Vergleiche mit',
      'last7_days': 'Letzte 7 Tage',
      'last_week': 'Letzte Woche',
      'last30_days': 'Letzte 30 Tage',
      'this_month': 'Dieser Monat',
      'last_month': 'Letzter Monat',
      'this_year': 'Dieses Jahr',
      'last_year': 'Letztes Jahr',
      'all_time': 'Allzeit',
      'custom': 'Benutzerdefiniert',
      'clone_to_invoice': 'Klone in Rechnung',
      'clone_to_quote': 'Als Angebot duplizieren',
      'clone_to_credit': 'Zur Gutschrift duplizieren',
      'view_invoice': 'Rechnung ansehen',
      'convert': 'Konvertiere',
      'more': 'Mehr',
      'edit_client': 'Kunde bearbeiten',
      'edit_product': 'Produkt bearbeiten',
      'edit_invoice': 'Rechnung bearbeiten',
      'edit_quote': 'Angebot bearbeiten',
      'edit_payment': 'Zahlung bearbeiten',
      'edit_task': 'Aufgabe bearbeiten',
      'edit_expense': 'Ausgabe Bearbeiten',
      'edit_vendor': 'Lieferant Bearbeiten',
      'edit_project': 'Projekt bearbeiten',
      'edit_recurring_quote': 'Bearbeite wiederkehrendes Angebot',
      'billing_address': 'Rechnungsadresse',
      'shipping_address': 'Lieferadresse',
      'total_revenue': 'Gesamteinnahmen',
      'average_invoice': 'Durchschnittlicher Rechnungsbetrag',
      'outstanding': 'Ausstehend',
      'invoices_sent': ':count Rechnungen versendet',
      'active_clients': 'aktive Kunden',
      'close': 'Schließen',
      'email': 'E-Mail',
      'password': 'Passwort',
      'url': 'URL',
      'secret': 'Passwort',
      'name': 'Name',
      'logout': 'Abmelden',
      'login': 'Login',
      'filter': 'Filter',
      'sort': 'Sortierung',
      'search': 'Suche',
      'active': 'Aktiv',
      'archived': 'Archiviert',
      'deleted': 'Gelöscht',
      'dashboard': 'Übersicht',
      'archive': 'Archivieren',
      'delete': 'Löschen',
      'restore': 'Wiederherstellen',
      'refresh_complete': 'Aktualisieren beendet',
      'please_enter_your_email': 'Bitte geben Sie Ihre E-Mail-Adresse ein',
      'please_enter_your_password': 'Bitte geben Sie Ihr Passwort ein',
      'please_enter_your_url': 'Bitte geben Sie Ihre URL ein',
      'please_enter_a_product_key':
          'Bitte geben Sie Ihren Produkt schlüssel ein',
      'ascending': 'Aufsteigend',
      'descending': 'Absteigend',
      'save': 'Speichern',
      'an_error_occurred': 'Ein Fehler ist aufgetreten',
      'paid_to_date': 'Bereits gezahlt',
      'balance_due': 'Offener Betrag',
      'balance': 'Saldo',
      'overview': 'Übersicht',
      'details': 'Details',
      'phone': 'Telefon',
      'website': 'Webseite',
      'vat_number': 'USt-IdNr.',
      'id_number': 'Registernummer',
      'create': 'Erstellen',
      'copied_to_clipboard': ':value in die Zwischenablage kopiert',
      'error': 'Fehler',
      'could_not_launch': 'Konnte nicht gestartet werden',
      'contacts': 'Kontakte',
      'additional': 'Zusätzlich',
      'first_name': 'Vorname',
      'last_name': 'Nachname',
      'add_contact': 'Kontakt hinzufügen',
      'are_you_sure': 'Sind Sie sicher?',
      'cancel': 'Abbrechen',
      'ok': 'Ok',
      'remove': 'Entfernen',
      'email_is_invalid': 'E-Mail ist ungültig',
      'product': 'Produkt',
      'products': 'Produkte',
      'new_product': 'Neues Produkt',
      'created_product': 'Produkt erfolgreich erstellt',
      'updated_product': 'Produkt erfolgreich aktualisiert',
      'archived_product': 'Produkt erfolgreich archiviert',
      'deleted_product': 'Produkt erfolgreich gelöscht',
      'restored_product': 'Produkt erfolgreich wiederhergestellt',
      'archived_products': 'Archivierung erfolgreich :Produktzähler',
      'deleted_products': 'Erfolgreich :count Produkte gelöscht',
      'restored_products': ':value Produkte erfolgreich wiederhergestellt',
      'product_key': 'Produkt',
      'notes': 'Notizen',
      'cost': 'Kosten',
      'client': 'Kunde',
      'clients': 'Kunden',
      'new_client': 'Neuer Kunde',
      'created_client': 'Kunde erfolgreich angelegt',
      'updated_client': 'Kunde erfolgreich aktualisiert',
      'archived_client': 'Kunde erfolgreich archiviert',
      'archived_clients': ':count Kunden erfolgreich archiviert',
      'deleted_client': 'Kunde erfolgreich gelöscht',
      'deleted_clients': ':count Kunden erfolgreich gelöscht',
      'restored_client': 'Kunde erfolgreich wiederhergestellt',
      'restored_clients': ':value Kunden erfolgreich wiederhergestellt',
      'address1': 'Straße',
      'address2': 'Adresszusatz',
      'city': 'Stadt',
      'state': 'Bundesland',
      'postal_code': 'Postleitzahl',
      'country': 'Land',
      'invoice': 'Rechnung',
      'invoices': 'Rechnungen',
      'new_invoice': 'Neue Rechnung',
      'created_invoice': 'Rechnung erfolgreich erstellt',
      'updated_invoice': 'Rechnung erfolgreich aktualisiert',
      'archived_invoice': 'Rechnung erfolgreich archiviert',
      'deleted_invoice': 'Rechnung erfolgreich gelöscht',
      'restored_invoice': 'Rechnung erfolgreich wiederhergestellt',
      'archived_invoices': ':count Rechnungen erfolgreich archiviert',
      'deleted_invoices': ':count Rechnungen erfolgreich gelöscht',
      'restored_invoices': ':value Rechnungen erfolgreich wiederhergestellt',
      'emailed_invoice': 'Rechnung erfolgreich versendet',
      'emailed_payment': 'Zahlungs-E-Mail erfolgreich gesendet',
      'amount': 'Betrag',
      'invoice_number': 'Rechnungsnummer',
      'invoice_date': 'Rechnungsdatum',
      'discount': 'Rabatt',
      'po_number': 'Bestellnummer',
      'terms': 'Bedingungen',
      'public_notes': 'Öffentliche Notizen',
      'private_notes': 'Interne Notizen',
      'frequency': 'Häufigkeit',
      'start_date': 'Startdatum',
      'end_date': 'Enddatum',
      'quote_number': 'Angebotsnummer',
      'quote_date': 'Angebotsdatum',
      'valid_until': 'Gültig bis',
      'items': 'Element',
      'partial_deposit': 'Teil-/Anzahlung',
      'description': 'Beschreibung',
      'unit_cost': 'Einzelpreis',
      'quantity': 'Menge',
      'add_item': 'Artikel hinzufügen',
      'contact': 'Kontakt',
      'work_phone': 'Telefon',
      'total_amount': 'Gesamtbetrag',
      'pdf': 'PDF',
      'due_date': 'Fälligkeitsdatum',
      'partial_due_date': 'Teilzahlungsziel',
      'paid_date': 'Zahlungsdatum',
      'status': 'Status',
      'invoice_status_id': 'Rechnungs Status',
      'quote_status': 'Angebotsstatus',
      'click_plus_to_add_item':
          'Klicken Sie auf +, um ein Element hinzuzufügen.',
      'click_plus_to_add_time': 'Klicken Sie auf +, um die Zeit hinzuzufügen.',
      'count_selected': ':count ausgewählt',
      'total': 'Gesamt',
      'percent': 'Prozent',
      'edit': 'Bearbeiten',
      'dismiss': 'Verwerfen',
      'please_select_a_date': 'Bitte wählen Sie ein Datum',
      'please_select_a_client': 'Bitte wählen Sie einen Kunden',
      'please_select_an_invoice': 'Bitte wählen Sie eine Rechnung aus',
      'task_rate': 'Stundensatz',
      'settings': 'Einstellungen',
      'language': 'Sprache',
      'currency': 'Währung',
      'created_at': 'Erstellt am',
      'created_on': 'Erstellt am',
      'updated_at': 'Aktualisiert',
      'tax': 'Steuer',
      'please_enter_an_invoice_number':
          'Bitte geben Sie eine Rechnungs Nummer ein',
      'please_enter_a_quote_number': 'Bitte geben Sie eine Angebots Nummer ein',
      'past_due': 'Überfällig',
      'draft': 'Entwurf',
      'sent': 'Versendet',
      'viewed': 'Angesehen',
      'approved': 'Bestätigt',
      'partial': 'Teil-/Anzahlung',
      'paid': 'Bezahlt',
      'mark_sent': 'Als versendet markieren',
      'marked_invoice_as_sent': 'Rechnung erfolgreich als versendet markiert',
      'marked_invoice_as_paid':
          'Die Rechnung wurde erfolgreich als \'bezahlt\' markiert',
      'marked_invoices_as_sent':
          'Erfolgreich Rechnungen als versendet markiert',
      'marked_invoices_as_paid':
          'Die Rechnungen wurden erfolgreich als \'bezahlt\' markiert',
      'done': 'Erledigt',
      'please_enter_a_client_or_contact_name':
          'Bitte geben Sie einen Kunden- oder Kontaktnamen ein',
      'dark_mode': 'Dunkler Modus',
      'restart_app_to_apply_change':
          'Starten Sie die App neu, um die Änderung zu übernehmen.',
      'refresh_data': 'Daten aktualisieren',
      'blank_contact': 'Leerer Kontakt',
      'activity': 'Aktivität',
      'no_records_found': 'Kein Einträge gefunden',
      'clone': 'Duplizieren',
      'loading': 'Lädt',
      'industry': 'Kategorie',
      'size': 'Größe',
      'payment_terms': 'Zahlungsbedingungen',
      'payment_date': 'Zahlungsdatum',
      'payment_status': 'Zahlungsstatus',
      'payment_status_1': 'Ausstehend',
      'payment_status_2': 'entwertet',
      'payment_status_3': 'Fehlgeschlagen',
      'payment_status_4': 'Abgeschlossen',
      'payment_status_5': 'Teilweise erstattet',
      'payment_status_6': 'Erstattet',
      'payment_status_-1': 'nicht angewendet',
      'payment_status_-2': 'Teilweise nicht angewendet',
      'net': 'Netto',
      'client_portal': 'Kunden-Portal',
      'show_tasks': 'Aufgaben anzeigen',
      'email_reminders': 'Mahnungs-E-Mail',
      'enabled': 'Aktiviert',
      'recipients': 'Empfänger',
      'initial_email': 'Initiale E-Mail',
      'first_reminder': 'Erste Mahnung',
      'second_reminder': 'Zweite Mahnung',
      'third_reminder': 'Dritte Mahnung',
      'reminder1': 'Erste Mahnung',
      'reminder2': 'Zweite Mahnung',
      'reminder3': 'Dritte Mahnung',
      'template': 'Vorlage',
      'send': 'Senden',
      'subject': 'Betreff',
      'body': 'Inhalt',
      'send_email': 'E-Mail senden',
      'email_receipt': 'Zahlungsbestätigung an Kunden per E-Mail senden',
      'auto_billing': 'Automatische Rechnungsstellung',
      'button': 'Knopf',
      'preview': 'Vorschau',
      'customize': 'Anpassen',
      'history': 'Verlauf',
      'payment': 'Zahlung',
      'payments': 'Zahlungen',
      'refunded': 'Erstattet',
      'payment_type': 'Zahlungsart',
      'transaction_reference': 'Abwicklungsreferenz',
      'enter_payment': 'Zahlung eingeben',
      'new_payment': 'Zahlung eingeben',
      'created_payment': 'Zahlung erfolgreich erstellt',
      'updated_payment': 'Zahlung erfolgreich aktualisiert',
      'archived_payment': 'Zahlung erfolgreich archiviert',
      'deleted_payment': 'Zahlung erfolgreich gelöscht',
      'restored_payment': 'Zahlung erfolgreich wiederhergestellt',
      'archived_payments': ':count Zahlungen erfolgreich archiviert',
      'deleted_payments': ':count Zahlungen erfolgreich gelöscht',
      'restored_payments': ':value Zahlungen erfolgreich wiederhergestellt',
      'quote': 'Angebot',
      'quotes': 'Angebote',
      'new_quote': 'Neues Angebot',
      'created_quote': 'Angebot erfolgreich erstellt',
      'updated_quote': 'Angebot erfolgreich aktualisiert',
      'archived_quote': 'Angebot erfolgreich archiviert',
      'deleted_quote': 'Angebot erfolgreich gelöscht',
      'restored_quote': 'Angebot erfolgreich wiederhergestellt',
      'archived_quotes': ':count Angebote erfolgreich archiviert',
      'deleted_quotes': ':count Angebote erfolgreich gelöscht',
      'restored_quotes': ':value Angebote erfolgreich wiederhergestellt',
      'expense': 'Ausgabe',
      'expenses': 'Ausgaben',
      'vendor': 'Lieferant',
      'vendors': 'Lieferanten',
      'task': 'Aufgabe',
      'tasks': 'Zeiterfassung',
      'project': 'Projekt',
      'projects': 'Projekte',
      'activity_1': ':user erstellte Kunde :client',
      'activity_2': ':user archivierte Kunde :client',
      'activity_3': ':user löschte Kunde :client',
      'activity_4': ':user erstellte Rechnung :invoice',
      'activity_5': ':user aktualisierte Rechnung :invoice',
      'activity_6': ':user mailte Rechnung :invoice für :client an :contact',
      'activity_7': ':contact hat Rechnung :invoice für :client angesehen',
      'activity_8': ':user archivierte Rechnung :invoice',
      'activity_9': ':user löschte Rechnung :invoice',
      'activity_10':
          ':user hat die Zahlung :payment über :payment_amount der Rechnung :invoice für Kunde :client eingegeben',
      'activity_11': ':user aktualisierte Zahlung :payment',
      'activity_12': ':user archivierte Zahlung :payment',
      'activity_13': ':user löschte Zahlung :payment',
      'activity_14': ':user gab :credit Gutschrift ein',
      'activity_15': ':user aktualisierte :credit Gutschrift',
      'activity_16': ':user archivierte :credit Gutschrift',
      'activity_17': ':user löschte :credit Gutschrift',
      'activity_18': ':user erstellte Angebot :quote',
      'activity_19': ':user aktualisierte Angebot :quote',
      'activity_20': ':user mailte Angebot :quote für :client an :contact',
      'activity_21': ':contact hat Angebot :quote angesehen',
      'activity_22': ':user archiviertes Angebot :quote',
      'activity_23': ':user löschte Angebot :quote',
      'activity_24': ':user stellte Angebot :quote wieder her',
      'activity_25': ':user stellte Rechnung :invoice wieder her',
      'activity_26': ':user stellte Kunde :client wieder her',
      'activity_27': ':user stellte Zahlung :payment wieder her',
      'activity_28': ':user stellte Gutschrift :credit wieder her',
      'activity_29': ':contact akzeptierte Angebot :quote für :client',
      'activity_30': ':user hat Lieferant :vendor erstellt',
      'activity_31': ':user hat Lieferant :vendor archiviert',
      'activity_32': ':user hat Lieferant :vendor gelöscht',
      'activity_33': ':user hat Lieferant :vendor wiederhergestellt',
      'activity_34': ':user erstellte Ausgabe :expense',
      'activity_35': ':user hat Ausgabe :expense archiviert',
      'activity_36': ':user hat Ausgabe :expense gelöscht',
      'activity_37': ':user hat Ausgabe :expense wiederhergestellt',
      'activity_39':
          ':user brach eine Zahlung über :payment_amount ab :payment',
      'activity_40':
          ':user hat :adjustment von :payment_amount der Zahlung :payment zurück erstattet',
      'activity_41': ':payment_amount Zahlung (:payment) schlug fehl',
      'activity_42': ':user hat Aufgabe :task erstellt',
      'activity_43': ':user hat Aufgabe :task bearbeitet',
      'activity_44': ':user hat Aufgabe :task archiviert',
      'activity_45': ':user hat Aufgabe :task gelöscht',
      'activity_46': ':user hat Aufgabe :task wiederhergestellt',
      'activity_47': ':user hat Ausgabe :expense bearbeitet',
      'activity_48': ':user erstellte Benutzer :user',
      'activity_49': ':user aktualisierte Benutzer :user',
      'activity_50': ':user archivierte Benutzer :user',
      'activity_51': ':user löschte Benutzer :user',
      'activity_52': ':user hat Benutzer :user wiederhergestellt',
      'activity_53': ':user markierte Rechnung :invoice als versendet',
      'activity_54': ':user zahlt Rechnung :invoice',
      'activity_55': ':contact hat auf Ticket :ticket geantwortet',
      'activity_56': ':user  hat Ticket :ticket angesehen',
      'activity_57':
          'Das System konnte die Rechnung :invoice nicht per E-Mail versenden',
      'activity_58': ':user buchte Rechnung :invoice zurück',
      'activity_59': ':user brach Rechnung :invoice ab',
      'activity_60': ':contact schaute Angebot :quote an',
      'activity_61': ':user hat Kunde :client aktualisiert',
      'activity_62': ':user hat Lieferant :vendor aktualisiert',
      'activity_63':
          ':user mailte erste Mahnung für Rechnung :invoice an :contact',
      'activity_64':
          ':user mailte zweite Mahnung für Rechnung :invoice an :contact',
      'activity_65':
          ':user mailte dritte Mahnung für Rechnung :invoice an :contact',
      'activity_66':
          ':user mailte endlose Mahnung für Rechnung :invoice an :contact',
      'activity_80': ':user hat Abonnement :subscription erstellt',
      'activity_81': ':user hat Abonnement :subscription geändert',
      'activity_82': ':user hat Abonnement :subscription archiviert',
      'activity_83': ':user hat Abonnement :subscription gelöscht',
      'activity_84': ':user hat Abonnement :subscription wiederhergestellt',
      'one_time_password': 'Einmaliges Passwort',
      'emailed_quote': 'Angebot erfolgreich versendet',
      'emailed_credit': 'Gutschrift erfolgreich per E-Mail versendet',
      'marked_quote_as_sent': 'Angebot erfolgreich als versendet markiert',
      'marked_credit_as_sent': 'Gutschrift erfolgreich als versendet markiert',
      'expired': 'Abgelaufen',
      'all': 'Alle',
      'select': 'Wählen',
      'long_press_multiselect': 'Mehrfachauswahl durch langes Drücken',
      'custom_value1': 'Benutzerdefinierter Wert 1',
      'custom_value2': 'Benutzerdefinierter Wert 2',
      'custom_value3': 'Benutzerdefinierter Wert 3',
      'custom_value4': 'Benutzerdefinierter Wert 4',
      'email_style_custom': 'Benutzer definierter E-Mail-Stil',
      'custom_message_dashboard': 'Benutzerdefinierte Dashboard-Nachricht',
      'custom_message_unpaid_invoice':
          'Benutzerdefinierte Nachricht für unbezahlte Rechnung',
      'custom_message_paid_invoice':
          'Benutzerdefinierte Nachricht für bezahlte Rechnung',
      'custom_message_unapproved_quote':
          'Benutzerdefinierte Nachricht für nicht genehmigtes Angebot',
      'lock_invoices': 'Rechnung sperren',
      'translations': 'Übersetzungen',
      'task_number_pattern': 'Aufgabennummernschema',
      'task_number_counter': 'Aufgabennummernzähler',
      'expense_number_pattern': 'Ausgabennummernschema',
      'expense_number_counter': 'Ausgabennummernzähler',
      'vendor_number_pattern': 'Lieferantennummernschema',
      'vendor_number_counter': 'Lieferantennummernzähler',
      'ticket_number_pattern': 'Ticketnummernschema',
      'ticket_number_counter': 'Ticketnummernzähler',
      'payment_number_pattern': 'Zahlungsnummernschema',
      'payment_number_counter': 'Zahlungsnummernzähler',
      'invoice_number_pattern': 'Rechnungsnummernschema',
      'invoice_number_counter': 'Zähler für Rechnungsnummer',
      'quote_number_pattern': 'Angebots-Nummernschema',
      'quote_number_counter': 'Zähler für Angebotsnummer',
      'client_number_pattern': 'Gutschriftnummernschema',
      'client_number_counter': 'Gutschriftnummernzähler',
      'credit_number_pattern': 'Gutschriftnummernzähler',
      'credit_number_counter': 'Gutschriftnummernzähler',
      'reset_counter_date': 'Zählerdatum zurücksetzen',
      'counter_padding': 'Zähler-Innenabstand',
      'shared_invoice_quote_counter': 'Rechnungs-/Angebots-Zähler teilen',
      'default_tax_name_1': 'Standard-Steuername 1',
      'default_tax_rate_1': 'Standard-Steuersatz 1',
      'default_tax_name_2': 'Standard-Steuername 2',
      'default_tax_rate_2': 'Standard-Steuersatz 2',
      'default_tax_name_3': 'Standard-Steuername 3',
      'default_tax_rate_3': 'Standard-Steuersatz 3',
      'email_subject_invoice': 'E-Mail Rechnung Betreff',
      'email_subject_quote': 'E-Mail Angebot Betreff',
      'email_subject_payment': 'E-Mail Zahlung Betreff',
      'email_subject_payment_partial': 'E-Mail Teilzahlung Betreff',
      'show_table': 'Zeige Tabelle',
      'show_list': 'Zeige Liste',
      'client_city': 'Kunden-Stadt',
      'client_state': 'Kunden-Bundesland/Kanton',
      'client_country': 'Kunden-Land',
      'client_is_active': 'Kunde ist aktiv',
      'client_balance': 'Kunden Betrag',
      'client_address1': 'Straße des Kunden',
      'client_address2': 'Adresszusatz',
      'vendor_address1': 'Straße Lieferant',
      'vendor_address2': 'Lieferant Apt/Suite',
      'client_shipping_address1': 'Strasse Kundenlieferanschrift',
      'client_shipping_address2': 'Addresszusatz Kundenlieferadresse',
      'type': 'Typ',
      'invoice_amount': 'Rechnungssumme',
      'invoice_due_date': 'Fälligkeitsdatum',
      'tax_rate1': 'Steuersatz 1',
      'tax_rate2': 'Steuersatz 2',
      'tax_rate3': 'Steuersatz 3',
      'auto_bill': 'Automatische Verrechnung',
      'archived_at': 'Archiviert um',
      'has_expenses': 'Hat Ausgaben',
      'custom_taxes1': 'Benutzerdefinierte Steuern 1',
      'custom_taxes2': 'Benutzerdefinierte Steuern 2',
      'custom_taxes3': 'Benutzerdefinierte Steuern 3',
      'custom_taxes4': 'Benutzerdefinierte Steuern 4',
      'custom_surcharge1': 'Benutzerdefinierter Zuschlag 1',
      'custom_surcharge2': 'Benutzerdefinierter Zuschlag 2',
      'custom_surcharge3': 'Benutzerdefinierter Zuschlag 3',
      'custom_surcharge4': 'Benutzerdefinierter Zuschlag 4',
      'is_deleted': 'ist gelöscht',
      'vendor_city': 'Lieferanten-Stadt',
      'vendor_state': 'Lieferanten-Bundesland/Kanton',
      'vendor_country': 'Lieferanten-Land',
      'is_approved': 'Wurde angenommen',
      'tax_name': 'Steuersatz Name',
      'tax_amount': 'Steuerwert',
      'tax_paid': 'Steuern bezahlt',
      'payment_amount': 'Zahlungsbetrag',
      'age': 'Alter',
      'is_running': 'Läuft derzeit',
      'time_log': 'Zeiten',
      'bank_id': 'Bank',
      'expense_category_id': 'Ausgabenkategorie ID',
      'expense_category': 'Ausgabenkategorie',
      'invoice_currency_id': 'Rechnungs-Währungs-ID',
      'tax_name1': 'Steuersatz Name 1',
      'tax_name2': 'Steuersatz Name 2',
      'tax_name3': 'Steuersatz Name 3',
      'transaction_id': 'Transaktions-ID',
      'status_color_theme': 'Status Farbschema',
      'load_color_theme': 'lade Farbschema',
    },
  };

  String get createdProject =>
      _localizedValues[localeCode]!['created_project']!;

  String get updatedProject =>
      _localizedValues[localeCode]!['updated_project']!;

  String get archivedProject =>
      _localizedValues[localeCode]!['archived_project']!;

  String get deletedProject =>
      _localizedValues[localeCode]!['deleted_project']!;

  String get restoredProject =>
      _localizedValues[localeCode]!['restored_project']!;

  String get archivedProjects =>
      _localizedValues[localeCode]!['archived_projects']!;

  String get deletedProjects =>
      _localizedValues[localeCode]!['deleted_projects']!;

  String get restoredProjects =>
      _localizedValues[localeCode]!['restored_projects']!;

  String get newProject => _localizedValues[localeCode]!['new_project']!;

  String get thankYouForUsingOurApp =>
      _localizedValues[localeCode]!['thank_you_for_using_our_app']!;

  String get ifYouLikeIt => _localizedValues[localeCode]!['if_you_like_it']!;

  String get clickHere => _localizedValues[localeCode]!['click_here']!;

  String get clickHereCapital =>
      _localizedValues[localeCode]!['click_here_capital']!;

  String get toRateIt => _localizedValues[localeCode]!['to_rate_it']!;

  String get average => _localizedValues[localeCode]!['average']!;

  String get unapproved => _localizedValues[localeCode]!['unapproved']!;

  String get authenticateToChangeSetting =>
      _localizedValues[localeCode]!['authenticate_to_change_setting']!;

  String get locked => _localizedValues[localeCode]!['locked']!;

  String get authenticate => _localizedValues[localeCode]!['authenticate']!;

  String get pleaseAuthenticate =>
      _localizedValues[localeCode]!['please_authenticate']!;

  String get biometricAuthentication =>
      _localizedValues[localeCode]!['biometric_authentication']!;

  String get footer => _localizedValues[localeCode]!['footer']!;

  String get compare => _localizedValues[localeCode]!['compare']!;

  String get hostedLogin => _localizedValues[localeCode]!['hosted_login']!;

  String get selfhostLogin => _localizedValues[localeCode]!['selfhost_login']!;

  String get googleSignIn => _localizedValues[localeCode]!['google_sign_in']!;

  String get today => _localizedValues[localeCode]!['today']!;

  String get customRange => _localizedValues[localeCode]!['custom_range']!;

  String get dateRange => _localizedValues[localeCode]!['date_range']!;

  String get current => _localizedValues[localeCode]!['current']!;

  String get previous => _localizedValues[localeCode]!['previous']!;

  String get currentPeriod => _localizedValues[localeCode]!['current_period']!;

  String get comparisonPeriod =>
      _localizedValues[localeCode]!['comparison_period']!;

  String get previousPeriod =>
      _localizedValues[localeCode]!['previous_period']!;

  String get previousYear => _localizedValues[localeCode]!['previous_year']!;

  String get compareTo => _localizedValues[localeCode]!['compare_to']!;

  String get last7Days => _localizedValues[localeCode]!['last7_days']!;

  String get lastWeek => _localizedValues[localeCode]!['last_week']!;

  String get last30Days => _localizedValues[localeCode]!['last30_days']!;

  String get thisMonth => _localizedValues[localeCode]!['this_month']!;

  String get lastMonth => _localizedValues[localeCode]!['last_month']!;

  String get thisYear => _localizedValues[localeCode]!['this_year']!;

  String get lastYear => _localizedValues[localeCode]!['last_year']!;

  String get allTime => _localizedValues[localeCode]!['all_time']!;

  String get custom => _localizedValues[localeCode]!['custom']!;

  String get cloneToInvoice =>
      _localizedValues[localeCode]!['clone_to_invoice']!;

  String get cloneToQuote => _localizedValues[localeCode]!['clone_to_quote']!;

  String get viewInvoice => _localizedValues[localeCode]!['view_invoice']!;

  String get convert => _localizedValues[localeCode]!['convert']!;

  String get more => _localizedValues[localeCode]!['more']!;

  String get editClient => _localizedValues[localeCode]!['edit_client']!;

  String get editProduct => _localizedValues[localeCode]!['edit_product']!;

  String get editInvoice => _localizedValues[localeCode]!['edit_invoice']!;

  String get editQuote => _localizedValues[localeCode]!['edit_quote']!;

  String get editPayment => _localizedValues[localeCode]!['edit_payment']!;

  String get editTask => _localizedValues[localeCode]!['edit_task']!;

  String get editExpense => _localizedValues[localeCode]!['edit_expense']!;

  String get editVendor => _localizedValues[localeCode]!['edit_vendor']!;

  String get editProject => _localizedValues[localeCode]!['edit_project']!;

  String get editCredit => _localizedValues[localeCode]!['edit_credit']!;

  String get editRecurringInvoice =>
      _localizedValues[localeCode]!['edit_recurring_invoice']!;

  String get editRecurringExpense =>
      _localizedValues[localeCode]!['edit_recurring_expense']!;

  String get editRecurringQuote =>
      _localizedValues[localeCode]!['edit_recurring_quote']!;

  String get billingAddress =>
      _localizedValues[localeCode]!['billing_address']!;

  String get shippingAddress =>
      _localizedValues[localeCode]!['shipping_address']!;

  String get totalRevenue => _localizedValues[localeCode]!['total_revenue']!;

  String get averageInvoice =>
      _localizedValues[localeCode]!['average_invoice']!;

  String get outstanding => _localizedValues[localeCode]!['outstanding']!;

  String get invoicesSent => _localizedValues[localeCode]!['invoices_sent']!;

  String get activeClients => _localizedValues[localeCode]!['active_clients']!;

  String get close => _localizedValues[localeCode]!['close']!;

  String get email => _localizedValues[localeCode]!['email']!;

  String get password => _localizedValues[localeCode]!['password']!;

  String get url => _localizedValues[localeCode]!['url']!;

  String get secret => _localizedValues[localeCode]!['secret']!;

  String get name => _localizedValues[localeCode]!['name']!;

  String get logout => _localizedValues[localeCode]!['logout']!;

  String get login => _localizedValues[localeCode]!['login']!;

  String get filter => _localizedValues[localeCode]!['filter']!;

  String get sort => _localizedValues[localeCode]!['sort']!;

  String get search => _localizedValues[localeCode]!['search']!;

  String get active => _localizedValues[localeCode]!['active']!;

  String get archived => _localizedValues[localeCode]!['archived']!;

  String get deleted => _localizedValues[localeCode]!['deleted']!;

  String get dashboard => _localizedValues[localeCode]!['dashboard']!;

  String get archive => _localizedValues[localeCode]!['archive']!;

  String get delete => _localizedValues[localeCode]!['delete']!;

  String get restore => _localizedValues[localeCode]!['restore']!;

  String get refreshComplete =>
      _localizedValues[localeCode]!['refresh_complete']!;

  String get pleaseEnterYourEmail =>
      _localizedValues[localeCode]!['please_enter_your_email']!;

  String get pleaseEnterYourPassword =>
      _localizedValues[localeCode]!['please_enter_your_password']!;

  String get pleaseEnterYourUrl =>
      _localizedValues[localeCode]!['please_enter_your_url']!;

  String get pleaseEnterAProductKey =>
      _localizedValues[localeCode]!['please_enter_a_product_key']!;

  String get pleaseEnterAFirstName =>
      _localizedValues[localeCode]!['please_enter_a_first_name']!;

  String get pleaseEnterALastName =>
      _localizedValues[localeCode]!['please_enter_a_last_name']!;

  String get ascending => _localizedValues[localeCode]!['ascending']!;

  String get descending => _localizedValues[localeCode]!['descending']!;

  String get save => _localizedValues[localeCode]!['save']!;

  String get anErrorOccurred =>
      _localizedValues[localeCode]!['an_error_occurred']!;

  String get paidToDate => _localizedValues[localeCode]!['paid_to_date']!;

  String get balanceDue => _localizedValues[localeCode]!['balance_due']!;

  String get balance => _localizedValues[localeCode]!['balance']!;

  String get overview => _localizedValues[localeCode]!['overview']!;

  String get details => _localizedValues[localeCode]!['details']!;

  String get phone => _localizedValues[localeCode]!['phone']!;

  String get website => _localizedValues[localeCode]!['website']!;

  String get vatNumber => _localizedValues[localeCode]!['vat_number']!;

  String get idNumber => _localizedValues[localeCode]!['id_number']!;

  String get create => _localizedValues[localeCode]!['create']!;

  String get copiedToClipboard =>
      _localizedValues[localeCode]!['copied_to_clipboard']!;

  String get error => _localizedValues[localeCode]!['error']!;

  String get couldNotLaunch =>
      _localizedValues[localeCode]!['could_not_launch']!;

  String get contacts => _localizedValues[localeCode]!['contacts']!;

  String get additional => _localizedValues[localeCode]!['additional']!;

  String get firstName => _localizedValues[localeCode]!['first_name']!;

  String get lastName => _localizedValues[localeCode]!['last_name']!;

  String get addContact => _localizedValues[localeCode]!['add_contact']!;

  String get areYouSure => _localizedValues[localeCode]!['are_you_sure']!;

  String get cancel => _localizedValues[localeCode]!['cancel']!;

  String get ok => _localizedValues[localeCode]!['ok']!;

  String get remove => _localizedValues[localeCode]!['remove']!;

  String get emailIsInvalid =>
      _localizedValues[localeCode]!['email_is_invalid']!;

  String get product => _localizedValues[localeCode]!['product']!;

  String get products => _localizedValues[localeCode]!['products']!;

  String get newProduct => _localizedValues[localeCode]!['new_product']!;

  String get createdProduct =>
      _localizedValues[localeCode]!['created_product']!;

  String get updatedProduct =>
      _localizedValues[localeCode]!['updated_product']!;

  String get archivedProduct =>
      _localizedValues[localeCode]!['archived_product']!;

  String get deletedProduct =>
      _localizedValues[localeCode]!['deleted_product']!;

  String get restoredProduct =>
      _localizedValues[localeCode]!['restored_product']!;

  String get archivedProducts =>
      _localizedValues[localeCode]!['archived_products']!;

  String get deletedProducts =>
      _localizedValues[localeCode]!['deleted_products']!;

  String get restoredProducts =>
      _localizedValues[localeCode]!['restored_products']!;

  String get newVendor => _localizedValues[localeCode]!['new_vendor']!;

  String get createdVendor => _localizedValues[localeCode]!['created_vendor']!;

  String get updatedVendor => _localizedValues[localeCode]!['updated_vendor']!;

  String get archivedVendor =>
      _localizedValues[localeCode]!['archived_vendor']!;

  String get deletedVendor => _localizedValues[localeCode]!['deleted_vendor']!;

  String get restoredVendor =>
      _localizedValues[localeCode]!['restored_vendor']!;

  String get archivedVendors =>
      _localizedValues[localeCode]!['archived_vendors']!;

  String get deletedVendors =>
      _localizedValues[localeCode]!['deleted_vendors']!;

  String get restoredVendors =>
      _localizedValues[localeCode]!['restored_vendors']!;

  String get document => _localizedValues[localeCode]!['document']!;

  String get documents => _localizedValues[localeCode]!['documents']!;

  String get newDocument => _localizedValues[localeCode]!['new_document']!;

  String get editDocument => _localizedValues[localeCode]!['edit_document']!;

  String get uploadedDocument =>
      _localizedValues[localeCode]!['uploaded_document']!;

  String get updatedDocument =>
      _localizedValues[localeCode]!['updated_document']!;

  String get archivedDocument =>
      _localizedValues[localeCode]!['archived_document']!;

  String get deletedDocument =>
      _localizedValues[localeCode]!['deleted_document']!;

  String get restoredDocument =>
      _localizedValues[localeCode]!['restored_document']!;

  String get archivedDocuments =>
      _localizedValues[localeCode]!['archived_documents']!;

  String get deletedDocuments =>
      _localizedValues[localeCode]!['deleted_documents']!;

  String get restoredDocuments =>
      _localizedValues[localeCode]!['restored_documents']!;

  String get newExpense => _localizedValues[localeCode]!['new_expense']!;

  String get createdExpense =>
      _localizedValues[localeCode]!['created_expense']!;

  String get updatedExpense =>
      _localizedValues[localeCode]!['updated_expense']!;

  String get archivedExpense =>
      _localizedValues[localeCode]!['archived_expense']!;

  String get deletedExpense =>
      _localizedValues[localeCode]!['deleted_expense']!;

  String get restoredExpense =>
      _localizedValues[localeCode]!['restored_expense']!;

  String get archivedExpenses =>
      _localizedValues[localeCode]!['archived_expenses']!;

  String get deletedExpenses =>
      _localizedValues[localeCode]!['deleted_expenses']!;

  String get restoredExpenses =>
      _localizedValues[localeCode]!['restored_expenses']!;

  String get productKey => _localizedValues[localeCode]!['product_key']!;

  String get notes => _localizedValues[localeCode]!['notes']!;

  String get cost => _localizedValues[localeCode]!['cost']!;

  String get client => _localizedValues[localeCode]!['client']!;

  String get clients => _localizedValues[localeCode]!['clients']!;

  String get newClient => _localizedValues[localeCode]!['new_client']!;

  String get createdClient => _localizedValues[localeCode]!['created_client']!;

  String get updatedClient => _localizedValues[localeCode]!['updated_client']!;

  String get archivedClient =>
      _localizedValues[localeCode]!['archived_client']!;

  String get deletedClient => _localizedValues[localeCode]!['deleted_client']!;

  String get restoredClient =>
      _localizedValues[localeCode]!['restored_client']!;

  String get archivedClients =>
      _localizedValues[localeCode]!['archived_clients']!;

  String get deletedClients =>
      _localizedValues[localeCode]!['deleted_clients']!;

  String get restoredClients =>
      _localizedValues[localeCode]!['restored_clients']!;

  String get address1 => _localizedValues[localeCode]!['address1']!;

  String get address2 => _localizedValues[localeCode]!['address2']!;

  String get city => _localizedValues[localeCode]!['city']!;

  String get state => _localizedValues[localeCode]!['state']!;

  String get postalCode => _localizedValues[localeCode]!['postal_code']!;

  String get country => _localizedValues[localeCode]!['country']!;

  String get invoice => _localizedValues[localeCode]!['invoice']!;

  String get invoices => _localizedValues[localeCode]!['invoices']!;

  String get newInvoice => _localizedValues[localeCode]!['new_invoice']!;

  String get createdInvoice =>
      _localizedValues[localeCode]!['created_invoice']!;

  String get updatedInvoice =>
      _localizedValues[localeCode]!['updated_invoice']!;

  String get archivedInvoice =>
      _localizedValues[localeCode]!['archived_invoice']!;

  String get deletedInvoice =>
      _localizedValues[localeCode]!['deleted_invoice']!;

  String get restoredInvoice =>
      _localizedValues[localeCode]!['restored_invoice']!;

  String get archivedInvoices =>
      _localizedValues[localeCode]!['archived_invoices']!;

  String get deletedInvoices =>
      _localizedValues[localeCode]!['deleted_invoices']!;

  String get restoredInvoices =>
      _localizedValues[localeCode]!['restored_invoices']!;

  String get emailedInvoice =>
      _localizedValues[localeCode]!['emailed_invoice']!;

  String get emailedPayment =>
      _localizedValues[localeCode]!['emailed_payment']!;

  String get amount => _localizedValues[localeCode]!['amount']!;

  String get invoiceNumber => _localizedValues[localeCode]!['invoice_number']!;

  String get invoiceDate => _localizedValues[localeCode]!['invoice_date']!;

  String get discount => _localizedValues[localeCode]!['discount']!;

  String get poNumber => _localizedValues[localeCode]!['po_number']!;

  String get terms => _localizedValues[localeCode]!['terms']!;

  String get publicNotes => _localizedValues[localeCode]!['public_notes']!;

  String get privateNotes => _localizedValues[localeCode]!['private_notes']!;

  String get frequency => _localizedValues[localeCode]!['frequency']!;

  String get startDate => _localizedValues[localeCode]!['start_date']!;

  String get endDate => _localizedValues[localeCode]!['end_date']!;

  String get quoteNumber => _localizedValues[localeCode]!['quote_number']!;

  String get quoteDate => _localizedValues[localeCode]!['quote_date']!;

  String get validUntil => _localizedValues[localeCode]!['valid_until']!;

  String get items => _localizedValues[localeCode]!['items']!;

  String get partialDeposit =>
      _localizedValues[localeCode]!['partial_deposit']!;

  String get description => _localizedValues[localeCode]!['description']!;

  String get unitCost => _localizedValues[localeCode]!['unit_cost']!;

  String get quantity => _localizedValues[localeCode]!['quantity']!;

  String get addItem => _localizedValues[localeCode]!['add_item']!;

  String get contact => _localizedValues[localeCode]!['contact']!;

  String get workPhone => _localizedValues[localeCode]!['work_phone']!;

  String get totalAmount => _localizedValues[localeCode]!['total_amount']!;

  String get pdf => _localizedValues[localeCode]!['pdf']!;

  String get dueDate => _localizedValues[localeCode]!['due_date']!;

  String get partialDueDate =>
      _localizedValues[localeCode]!['partial_due_date']!;

  String get status => _localizedValues[localeCode]!['status']!;

  String get invoiceStatusId =>
      _localizedValues[localeCode]!['invoice_status_id']!;

  String get quoteStatusId => _localizedValues[localeCode]!['quote_status']!;

  String get clickPlusToAddItem =>
      _localizedValues[localeCode]!['click_plus_to_add_item']!;

  String get clickPlusToAddTime =>
      _localizedValues[localeCode]!['click_plus_to_add_time']!;

  String get countSelected => _localizedValues[localeCode]!['count_selected']!;

  String get total => _localizedValues[localeCode]!['total']!;

  String get totals => _localizedValues[localeCode]!['totals']!;

  String get percent => _localizedValues[localeCode]!['percent']!;

  String get edit => _localizedValues[localeCode]!['edit']!;

  String get dismiss => _localizedValues[localeCode]!['dismiss']!;

  String get pleaseSelectADate =>
      _localizedValues[localeCode]!['please_select_a_date']!;

  String get pleaseSelectAClient =>
      _localizedValues[localeCode]!['please_select_a_client']!;

  String get pleaseSelectAnInvoice =>
      _localizedValues[localeCode]!['please_select_an_invoice']!;

  String get taskRate => _localizedValues[localeCode]!['task_rate']!;

  String get settings => _localizedValues[localeCode]!['settings']!;

  String get language => _localizedValues[localeCode]!['language']!;

  String get currency => _localizedValues[localeCode]!['currency']!;

  String get createdAt => _localizedValues[localeCode]!['created_at']!;

  String get createdOn => _localizedValues[localeCode]!['created_on']!;

  String get updatedAt => _localizedValues[localeCode]!['updated_at']!;

  String get tax => _localizedValues[localeCode]!['tax']!;

  String get pleaseEnterAnInvoiceNumber =>
      _localizedValues[localeCode]!['please_enter_an_invoice_number']!;

  String get pleaseEnterAQuoteNumber =>
      _localizedValues[localeCode]!['please_enter_a_quote_number']!;

  String get pastDue => _localizedValues[localeCode]!['past_due']!;

  String get draft => _localizedValues[localeCode]!['draft']!;

  String get sent => _localizedValues[localeCode]!['sent']!;

  String get viewed => _localizedValues[localeCode]!['viewed']!;

  String get approved => _localizedValues[localeCode]!['approved']!;

  String get partial => _localizedValues[localeCode]!['partial']!;

  String get paid => _localizedValues[localeCode]!['paid']!;

  String get markSent => _localizedValues[localeCode]!['mark_sent']!;

  String get markedInvoiceAsSent =>
      _localizedValues[localeCode]!['marked_invoice_as_sent']!;

  String get markedInvoiceAsPaid =>
      _localizedValues[localeCode]!['marked_invoice_as_paid']!;

  String get markedInvoicesAsSent =>
      _localizedValues[localeCode]!['marked_invoices_as_sent']!;

  String get markedInvoicesAsPaid =>
      _localizedValues[localeCode]!['marked_invoices_as_paid']!;

  String get done => _localizedValues[localeCode]!['done']!;

  String get pleaseEnterAClientOrContactName =>
      _localizedValues[localeCode]!['please_enter_a_client_or_contact_name'] ??
      '';

  String get darkMode => _localizedValues[localeCode]!['dark_mode']!;

  String get restartAppToApplyChange =>
      _localizedValues[localeCode]!['restart_app_to_apply_change']!;

  String get refreshData => _localizedValues[localeCode]!['refresh_data']!;

  String get blankContact => _localizedValues[localeCode]!['blank_contact']!;

  String get activity => _localizedValues[localeCode]!['activity']!;

  String get noRecordsFound =>
      _localizedValues[localeCode]!['no_records_found']!;

  String get clone => _localizedValues[localeCode]!['clone']!;

  String get loading => _localizedValues[localeCode]!['loading']!;

  String get industry => _localizedValues[localeCode]!['industry']!;

  String get size => _localizedValues[localeCode]!['size']!;

  String get paymentTerms => _localizedValues[localeCode]!['payment_terms']!;

  String get paymentDate => _localizedValues[localeCode]!['payment_date']!;

  String get paymentStatus => _localizedValues[localeCode]!['payment_status']!;

  String get paymentStatus1 =>
      _localizedValues[localeCode]!['payment_status_1']!;

  String get paymentStatus2 =>
      _localizedValues[localeCode]!['payment_status_2']!;

  String get paymentStatus3 =>
      _localizedValues[localeCode]!['payment_status_3']!;

  String get paymentStatus4 =>
      _localizedValues[localeCode]!['payment_status_4']!;

  String get paymentStatus5 =>
      _localizedValues[localeCode]!['payment_status_5']!;

  String get paymentStatus6 =>
      _localizedValues[localeCode]!['payment_status_6']!;

  String get net => _localizedValues[localeCode]!['net']!;

  String get clientPortal => _localizedValues[localeCode]!['client_portal']!;

  String get showTasks => _localizedValues[localeCode]!['show_tasks']!;

  String get emailReminders =>
      _localizedValues[localeCode]!['email_reminders']!;

  String get enabled => _localizedValues[localeCode]!['enabled']!;

  String get recipients => _localizedValues[localeCode]!['recipients']!;

  String get initialEmail => _localizedValues[localeCode]!['initial_email']!;

  String get firstReminder => _localizedValues[localeCode]!['first_reminder']!;

  String get secondReminder =>
      _localizedValues[localeCode]!['second_reminder']!;

  String get thirdReminder => _localizedValues[localeCode]!['third_reminder']!;

  String get template => _localizedValues[localeCode]!['template']!;

  String get send => _localizedValues[localeCode]!['send']!;

  String get subject => _localizedValues[localeCode]!['subject']!;

  String get body => _localizedValues[localeCode]!['body']!;

  String get sendEmail => _localizedValues[localeCode]!['send_email']!;

  String get emailReceipt => _localizedValues[localeCode]!['email_receipt']!;

  String get autoBilling => _localizedValues[localeCode]!['auto_billing']!;

  String get button => _localizedValues[localeCode]!['button']!;

  String get preview => _localizedValues[localeCode]!['preview']!;

  String get customize => _localizedValues[localeCode]!['customize']!;

  String get history => _localizedValues[localeCode]!['history']!;

  String get payment => _localizedValues[localeCode]!['payment']!;

  String get payments => _localizedValues[localeCode]!['payments']!;

  String get refunded => _localizedValues[localeCode]!['refunded']!;

  String get paymentType => _localizedValues[localeCode]!['payment_type']!;

  String get transactionReference =>
      _localizedValues[localeCode]!['transaction_reference']!;

  String get enterPayment => _localizedValues[localeCode]!['enter_payment']!;

  String get createdPayment =>
      _localizedValues[localeCode]!['created_payment']!;

  String get updatedPayment =>
      _localizedValues[localeCode]!['updated_payment']!;

  String get archivedPayment =>
      _localizedValues[localeCode]!['archived_payment']!;

  String get deletedPayment =>
      _localizedValues[localeCode]!['deleted_payment']!;

  String get restoredPayment =>
      _localizedValues[localeCode]!['restored_payment']!;

  String get archivedPayments =>
      _localizedValues[localeCode]!['archived_payments']!;

  String get deletedPayments =>
      _localizedValues[localeCode]!['deleted_payments']!;

  String get restoredPayments =>
      _localizedValues[localeCode]!['restored_payments']!;

  String get quote => _localizedValues[localeCode]!['quote']!;

  String get quotes => _localizedValues[localeCode]!['quotes']!;

  String get newQuote => _localizedValues[localeCode]!['new_quote']!;

  String get createdQuote => _localizedValues[localeCode]!['created_quote']!;

  String get updatedQuote => _localizedValues[localeCode]!['updated_quote']!;

  String get archivedQuote => _localizedValues[localeCode]!['archived_quote']!;

  String get deletedQuote => _localizedValues[localeCode]!['deleted_quote']!;

  String get restoredQuote => _localizedValues[localeCode]!['restored_quote']!;

  String get archivedQuotes =>
      _localizedValues[localeCode]!['archived_quotes']!;

  String get deletedQuotes => _localizedValues[localeCode]!['deleted_quotes']!;

  String get restoredQuotes =>
      _localizedValues[localeCode]!['restored_quotes']!;

  String get expense => _localizedValues[localeCode]!['expense']!;

  String get expenses => _localizedValues[localeCode]!['expenses']!;

  String get vendor => _localizedValues[localeCode]!['vendor']!;

  String get vendors => _localizedValues[localeCode]!['vendors']!;

  String get task => _localizedValues[localeCode]!['task']!;

  String get tasks => _localizedValues[localeCode]!['tasks']!;

  String get project => _localizedValues[localeCode]!['project']!;

  String get projects => _localizedValues[localeCode]!['projects']!;

  String get oneTimePassword =>
      _localizedValues[localeCode]!['one_time_password']!;

  String get emailedQuote => _localizedValues[localeCode]!['emailed_quote']!;

  String get emailedCredit => _localizedValues[localeCode]!['emailed_credit']!;

  String get markedQuoteAsSent =>
      _localizedValues[localeCode]!['marked_quote_as_sent']!;

  String get markedCreditAsSent =>
      _localizedValues[localeCode]!['marked_credit_as_sent']!;

  String get expired => _localizedValues[localeCode]!['expired']!;

  String get budgetedHours => _localizedValues[localeCode]!['budgeted_hours']!;

  String get pleaseEnterAName =>
      _localizedValues[localeCode]!['please_enter_a_name']!;

  String get createdTask => _localizedValues[localeCode]!['created_task']!;

  String get updatedTask => _localizedValues[localeCode]!['updated_task']!;

  String get archivedTask => _localizedValues[localeCode]!['archived_task']!;

  String get deletedTask => _localizedValues[localeCode]!['deleted_task']!;

  String get restoredTask => _localizedValues[localeCode]!['restored_task']!;

  String get archivedTasks => _localizedValues[localeCode]!['archived_tasks']!;

  String get deletedTasks => _localizedValues[localeCode]!['deleted_tasks']!;

  String get restoredTasks => _localizedValues[localeCode]!['restored_tasks']!;

  String get newTask => _localizedValues[localeCode]!['new_task']!;

  String get duration => _localizedValues[localeCode]!['duration']!;

  String get times => _localizedValues[localeCode]!['times']!;

  String get date => _localizedValues[localeCode]!['date']!;

  String get startTime => _localizedValues[localeCode]!['start_time']!;

  String get endTime => _localizedValues[localeCode]!['end_time']!;

  String get budgeted => _localizedValues[localeCode]!['budgeted']!;

  String get timer => _localizedValues[localeCode]!['timer']!;

  String get manual => _localizedValues[localeCode]!['manual']!;

  String get autoStartTasks =>
      _localizedValues[localeCode]!['auto_start_tasks']!;

  String get autoStartTasksHelp =>
      _localizedValues[localeCode]!['auto_start_tasks_help']!;

  String get now => _localizedValues[localeCode]!['now']!;

  String get startedTask => _localizedValues[localeCode]!['started_task']!;

  String get stoppedTask => _localizedValues[localeCode]!['stopped_task']!;

  String get resumedTask => _localizedValues[localeCode]!['resumed_task']!;

  String get start => _localizedValues[localeCode]!['start']!;

  String get stop => _localizedValues[localeCode]!['stop']!;

  String get taskErrors => _localizedValues[localeCode]!['task_errors']!;

  String get resume => _localizedValues[localeCode]!['resume']!;

  String get running => _localizedValues[localeCode]!['running']!;

  String get invoiced => _localizedValues[localeCode]!['invoiced']!;

  String get logged => _localizedValues[localeCode]!['logged']!;

  String get failedToFindRecord =>
      _localizedValues[localeCode]!['failed_to_find_record']!;

  String get passwordIsTooShort =>
      _localizedValues[localeCode]!['password_is_too_short']!;

  String get design => _localizedValues[localeCode]!['design']!;

  String get copyShipping => _localizedValues[localeCode]!['copy_shipping']!;

  String get copyBilling => _localizedValues[localeCode]!['copy_billing']!;

  String get address => _localizedValues[localeCode]!['address']!;

  String get category => _localizedValues[localeCode]!['category']!;

  String get markPaid => _localizedValues[localeCode]!['mark_paid']!;

  String get convertCurrency =>
      _localizedValues[localeCode]!['convert_currency']!;

  String get exchangeRate => _localizedValues[localeCode]!['exchange_rate']!;

  String get addDocumentsToInvoice =>
      _localizedValues[localeCode]!['add_documents_to_invoice']!;

  String get pending => _localizedValues[localeCode]!['pending']!;

  String get converted => _localizedValues[localeCode]!['converted']!;

  String get expenseStatus1 =>
      _localizedValues[localeCode]!['expense_status_1']!;

  String get expenseStatus2 =>
      _localizedValues[localeCode]!['expense_status_2']!;

  String get expenseStatus3 =>
      _localizedValues[localeCode]!['expense_status_3']!;

  String get expenseDate => _localizedValues[localeCode]!['expense_date']!;

  String get noHistory => _localizedValues[localeCode]!['no_history']!;

  String get takePicture => _localizedValues[localeCode]!['take_picture']!;

  String get selectFile => _localizedValues[localeCode]!['select_file']!;

  String get uploadFiles => _localizedValues[localeCode]!['upload_files']!;

  String get requiredFilesMissing =>
      _localizedValues[localeCode]!['required_files_missing']!;

  String get download => _localizedValues[localeCode]!['download']!;

  String get noRecordSelected =>
      _localizedValues[localeCode]!['no_record_selected']!;

  String get requiresAnEnterprisePlan =>
      _localizedValues[localeCode]!['requires_an_enterprise_plan']!;

  String get errorUnsavedChanges =>
      _localizedValues[localeCode]!['error_unsaved_changes']!;

  String get createNew => _localizedValues[localeCode]!['create_new']!;

  String get emailLogin => _localizedValues[localeCode]!['email_login']!;

  String get createAccount => _localizedValues[localeCode]!['create_account']!;

  String get viewWebsite => _localizedValues[localeCode]!['view_website']!;

  String get accountLogin => _localizedValues[localeCode]!['account_login']!;

  String get signUp => _localizedValues[localeCode]!['sign_up']!;

  String get googleSignUp => _localizedValues[localeCode]!['google_sign_up']!;

  String get pleaseAgreeToTermsAndPrivacy =>
      _localizedValues[localeCode]!['please_agree_to_terms_and_privacy']!;

  String get iAgreeToThe => _localizedValues[localeCode]!['i_agree_to_the']!;

  String get termsOfService =>
      _localizedValues[localeCode]!['terms_of_service']!;

  String get privacyPolicy => _localizedValues[localeCode]!['privacy_policy']!;

  String get upgrade => _localizedValues[localeCode]!['upgrade']!;

  String get proPlan => _localizedValues[localeCode]!['pro_plan']!;

  String get enterprisePlan =>
      _localizedValues[localeCode]!['enterprise_plan']!;

  String get countUsers => _localizedValues[localeCode]!['count_users']!;

  String get annualSubscription =>
      _localizedValues[localeCode]!['annual_subscription']!;

  String get pastPurchases => _localizedValues[localeCode]!['past_purchases']!;

  String get back => _localizedValues[localeCode]!['back']!;

  String get redeem => _localizedValues[localeCode]!['redeem']!;

  String get thankYouForYourPurchase =>
      _localizedValues[localeCode]!['thank_you_for_your_purchase']!;

  String get select => _localizedValues[localeCode]!['select']!;

  String get longPressSelectionIsDefault =>
      _localizedValues[localeCode]!['long_press_multiselect']!;

  String get all => _localizedValues[localeCode]!['all']!;

  String get emailSignUp => _localizedValues[localeCode]!['email_sign_up']!;

  String get price => _localizedValues[localeCode]!['price']!;

  String get companyDetails =>
      _localizedValues[localeCode]!['company_details']!;

  String get userDetails => _localizedValues[localeCode]!['user_details']!;

  String get localization => _localizedValues[localeCode]!['localization']!;

  String get onlinePayments =>
      _localizedValues[localeCode]!['online_payments']!;

  String get taxRates => _localizedValues[localeCode]!['tax_rates']!;

  String get notifications => _localizedValues[localeCode]!['notifications']!;

  String get importExport => _localizedValues[localeCode]!['import_export']!;

  String get customFields => _localizedValues[localeCode]!['custom_fields']!;

  String get invoiceDesign => _localizedValues[localeCode]!['invoice_design']!;

  String get buyNowButtons => _localizedValues[localeCode]!['buy_now_buttons']!;

  String get emailSettings => _localizedValues[localeCode]!['email_settings']!;

  String get templatesAndReminders =>
      _localizedValues[localeCode]!['templates_and_reminders']!;

  String get creditCardsAndBanks =>
      _localizedValues[localeCode]!['credit_cards_and_banks']!;

  String get dataVisualizations =>
      _localizedValues[localeCode]!['data_visualizations']!;

  String get basicSettings => _localizedValues[localeCode]!['basic_settings']!;

  String get advancedSettings =>
      _localizedValues[localeCode]!['advanced_settings']!;

  String get defaults => _localizedValues[localeCode]!['defaults']!;

  String get deviceSettings =>
      _localizedValues[localeCode]!['device_settings']!;

  String get productSettings =>
      _localizedValues[localeCode]!['product_settings']!;

  String get savedSettings => _localizedValues[localeCode]!['saved_settings']!;

  String get logo => _localizedValues[localeCode]!['logo']!;

  String get uploadLogo => _localizedValues[localeCode]!['upload_logo']!;

  String get uploadedLogo => _localizedValues[localeCode]!['uploaded_logo']!;

  String get newGroup => _localizedValues[localeCode]!['new_group']!;

  String get createdGroup => _localizedValues[localeCode]!['created_group']!;

  String get updatedGroup => _localizedValues[localeCode]!['updated_group']!;

  String get archivedGroup => _localizedValues[localeCode]!['archived_group']!;

  String get deletedGroup => _localizedValues[localeCode]!['deleted_group']!;

  String get restoredGroup => _localizedValues[localeCode]!['restored_group']!;

  String get archivedGroups =>
      _localizedValues[localeCode]!['archived_groups']!;

  String get deletedGroups => _localizedValues[localeCode]!['deleted_groups']!;

  String get restoredGroups =>
      _localizedValues[localeCode]!['restored_groups']!;

  String get editGroup => _localizedValues[localeCode]!['edit_group']!;

  String get groups => _localizedValues[localeCode]!['groups']!;

  String get groupSettings => _localizedValues[localeCode]!['group_settings']!;

  String get filteredByGroup =>
      _localizedValues[localeCode]!['filtered_by_group']!;

  String get filteredByClient =>
      _localizedValues[localeCode]!['filtered_by_client']!;

  String get filteredByVendor =>
      _localizedValues[localeCode]!['filtered_by_vendor']!;

  String get filteredByInvoice =>
      _localizedValues[localeCode]!['filtered_by_invoice']!;

  String get filteredByProject =>
      _localizedValues[localeCode]!['filtered_by_project']!;

  String get group => _localizedValues[localeCode]!['group']!;

  String get timezone => _localizedValues[localeCode]!['timezone']!;

  String get dateFormat => _localizedValues[localeCode]!['date_format']!;

  String get datetimeFormat =>
      _localizedValues[localeCode]!['datetime_format']!;

  String get militaryTime => _localizedValues[localeCode]!['military_time']!;

  String get militaryTimeHelp =>
      _localizedValues[localeCode]!['military_time_help']!;

  String get sendReminders => _localizedValues[localeCode]!['send_reminders']!;

  String get symbol => _localizedValues[localeCode]!['symbol']!;

  String get code => _localizedValues[localeCode]!['ocde']!;

  String get sunday => _localizedValues[localeCode]!['sunday']!;

  String get monday => _localizedValues[localeCode]!['monday']!;

  String get tuesday => _localizedValues[localeCode]!['tuesday']!;

  String get wednesday => _localizedValues[localeCode]!['wednesday']!;

  String get thursday => _localizedValues[localeCode]!['thursday']!;

  String get friday => _localizedValues[localeCode]!['friday']!;

  String get saturday => _localizedValues[localeCode]!['saturday']!;

  String get january => _localizedValues[localeCode]!['january']!;

  String get february => _localizedValues[localeCode]!['february']!;

  String get march => _localizedValues[localeCode]!['march']!;

  String get april => _localizedValues[localeCode]!['april']!;

  String get may => _localizedValues[localeCode]!['may']!;

  String get june => _localizedValues[localeCode]!['june']!;

  String get july => _localizedValues[localeCode]!['july']!;

  String get august => _localizedValues[localeCode]!['august']!;

  String get september => _localizedValues[localeCode]!['september']!;

  String get october => _localizedValues[localeCode]!['october']!;

  String get november => _localizedValues[localeCode]!['november']!;

  String get december => _localizedValues[localeCode]!['december']!;

  String get firstDayOfTheWeek =>
      _localizedValues[localeCode]!['first_day_of_the_week']!;

  String get firstMonthOfTheYear =>
      _localizedValues[localeCode]!['first_month_of_the_year']!;

  String get currencyFormat =>
      _localizedValues[localeCode]!['currency_format']!;

  String get disabled => _localizedValues[localeCode]!['disabled']!;

  String get defaultValue => _localizedValues[localeCode]!['default_value']!;

  String get discardChanges =>
      _localizedValues[localeCode]!['discard_changes']!;

  String get continueEditing =>
      _localizedValues[localeCode]!['continue_editing']!;

  String get editCompanyGateway =>
      _localizedValues[localeCode]!['edit_company_gateway']!;

  String get newCompanyGateway =>
      _localizedValues[localeCode]!['new_company_gateway']!;

  String get createdCompanyGateway =>
      _localizedValues[localeCode]!['created_company_gateway']!;

  String get updatedCompanyGateway =>
      _localizedValues[localeCode]!['updated_company_gateway']!;

  String get archivedCompanyGateway =>
      _localizedValues[localeCode]!['archived_company_gateway']!;

  String get deletedCompanyGateway =>
      _localizedValues[localeCode]!['deleted_company_gateway']!;

  String get restoredCompanyGateway =>
      _localizedValues[localeCode]!['restored_company_gateway']!;

  String get archivedCompanyGateways =>
      _localizedValues[localeCode]!['archived_company_gateways']!;

  String get deletedCompanyGateways =>
      _localizedValues[localeCode]!['deleted_company_gateways']!;

  String get restoredCompanyGateways =>
      _localizedValues[localeCode]!['restored_company_gateways']!;

  String get companyGateways =>
      _localizedValues[localeCode]!['company_gateways']!;

  String get companyGateway =>
      _localizedValues[localeCode]!['company_gateway']!;

  String get provider => _localizedValues[localeCode]!['provider']!;

  String get fees => _localizedValues[localeCode]!['fees']!;

  String get limits => _localizedValues[localeCode]!['limits']!;

  String get fillProducts => _localizedValues[localeCode]!['fill_products']!;

  String get fillProductsHelp =>
      _localizedValues[localeCode]!['fill_products_help']!;

  String get updateProducts =>
      _localizedValues[localeCode]!['update_products']!;

  String get updateProductsHelp =>
      _localizedValues[localeCode]!['update_products_help']!;

  String get convertProducts =>
      _localizedValues[localeCode]!['convert_products']!;

  String get convertProductsHelp =>
      _localizedValues[localeCode]!['convert_products_help']!;

  String get newTaxRate => _localizedValues[localeCode]!['new_tax_rate']!;

  String get createdTaxRate =>
      _localizedValues[localeCode]!['created_tax_rate']!;

  String get updatedTaxRate =>
      _localizedValues[localeCode]!['updated_tax_rate']!;

  String get archivedTaxRate =>
      _localizedValues[localeCode]!['archived_tax_rate']!;

  String get deletedTaxRate =>
      _localizedValues[localeCode]!['deleted_tax_rate']!;

  String get restoredTaxRate =>
      _localizedValues[localeCode]!['restored_tax_rate']!;

  String get archivedTaxRates =>
      _localizedValues[localeCode]!['archived_tax_rates']!;

  String get deletedTaxRates =>
      _localizedValues[localeCode]!['deleted_tax_rates']!;

  String get restoredTaxRates =>
      _localizedValues[localeCode]!['restored_tax_rates']!;

  String get editTaxRate => _localizedValues[localeCode]!['edit_tax_rate']!;

  String get taxRate => _localizedValues[localeCode]!['tax_rate']!;

  String get rate => _localizedValues[localeCode]!['rate']!;

  String get updateAddress => _localizedValues[localeCode]!['update_address']!;

  String get updateAddressHelp =>
      _localizedValues[localeCode]!['update_address_help']!;

  String get credentials => _localizedValues[localeCode]!['credentials']!;

  String get acceptedCardLogos =>
      _localizedValues[localeCode]!['accepted_card_logos']!;

  String get min => _localizedValues[localeCode]!['min']!;

  String get max => _localizedValues[localeCode]!['max']!;

  String get minLimit => _localizedValues[localeCode]!['min_limit']!;

  String get maxLimit => _localizedValues[localeCode]!['max_limit']!;

  String get enableMin => _localizedValues[localeCode]!['enable_min']!;

  String get enableMax => _localizedValues[localeCode]!['enable_max']!;

  String get limitsAndFees => _localizedValues[localeCode]!['limits_and_fees']!;

  String get feeAmount => _localizedValues[localeCode]!['fee_amount']!;

  String get feePercent => _localizedValues[localeCode]!['fee_percent']!;

  String get feeCap => _localizedValues[localeCode]!['fee_cap']!;

  String get priority => _localizedValues[localeCode]!['priority']!;

  String get creditCard => _localizedValues[localeCode]!['credit_card']!;

  String get bankTransfer => _localizedValues[localeCode]!['bank_transfer']!;

  String get processed => _localizedValues[localeCode]!['processed']!;

  String get replyToEmail => _localizedValues[localeCode]!['reply_to_email']!;

  String get replyToName => _localizedValues[localeCode]!['reply_to_name']!;

  String get bccEmail => _localizedValues[localeCode]!['bcc_email']!;

  String get attachPdf => _localizedValues[localeCode]!['attach_pdf']!;

  String get attachDocuments =>
      _localizedValues[localeCode]!['attach_documents']!;

  String get attachUbl => _localizedValues[localeCode]!['attach_ubl']!;

  String get emailStyle => _localizedValues[localeCode]!['email_style']!;

  String get enableMarkup =>
      _localizedValues[localeCode]!['enable_email_markup']!;

  String get enableMarkupHelp =>
      _localizedValues[localeCode]!['enable_email_markup_help']!;

  String get emailDesign => _localizedValues[localeCode]!['email_design']!;

  String get plain => _localizedValues[localeCode]!['plain']!;

  String get light => _localizedValues[localeCode]!['light']!;

  String get dark => _localizedValues[localeCode]!['dark']!;

  String get emailSignature =>
      _localizedValues[localeCode]!['email_signature']!;

  String get portalMode => _localizedValues[localeCode]!['portal_mode']!;

  String get domain => _localizedValues[localeCode]!['domain']!;

  String get subdomain => _localizedValues[localeCode]!['subdomain']!;

  String get authorization => _localizedValues[localeCode]!['authorization']!;

  String get enablePortalPassword =>
      _localizedValues[localeCode]!['enable_portal_password']!;

  String get enablePortalPasswordHelp =>
      _localizedValues[localeCode]!['enable_portal_password_help']!;

  String get showAcceptInvoiceTerms =>
      _localizedValues[localeCode]!['show_accept_invoice_terms']!;

  String get showAcceptInvoiceTermsHelp =>
      _localizedValues[localeCode]!['show_accept_invoice_terms_help']!;

  String get showAcceptQuoteTerms =>
      _localizedValues[localeCode]!['show_accept_quote_terms']!;

  String get showAcceptQuoteTermsHelp =>
      _localizedValues[localeCode]!['show_accept_quote_terms_help']!;

  String get requireInvoiceSignature =>
      _localizedValues[localeCode]!['require_invoice_signature']!;

  String get requireInvoiceSignatureHelp =>
      _localizedValues[localeCode]!['require_invoice_signature_help']!;

  String get requireQuoteSignature =>
      _localizedValues[localeCode]!['require_quote_signature']!;

  String get signatureOnPdf =>
      _localizedValues[localeCode]!['signature_on_pdf']!;

  String get signatureOnPdfHelp =>
      _localizedValues[localeCode]!['signature_on_pdf_help']!;

  String get customCss => _localizedValues[localeCode]!['custom_css']!;

  String get customJavascript =>
      _localizedValues[localeCode]!['custom_javascript']!;

  String get messages => _localizedValues[localeCode]!['messages']!;

  String get prefix => _localizedValues[localeCode]!['prefix']!;

  String get numberPattern => _localizedValues[localeCode]!['number_pattern']!;

  String get numberCounter => _localizedValues[localeCode]!['number_counter']!;

  String get creditField => _localizedValues[localeCode]!['credit_field']!;

  String get invoiceField => _localizedValues[localeCode]!['invoice_field']!;

  String get clientField => _localizedValues[localeCode]!['client_field']!;

  String get productField => _localizedValues[localeCode]!['product_field']!;

  String get paymentField => _localizedValues[localeCode]!['payment_field']!;

  String get contactField => _localizedValues[localeCode]!['contact_field']!;

  String get vendorField => _localizedValues[localeCode]!['vendor_field']!;

  String get expenseField => _localizedValues[localeCode]!['expense_field']!;

  String get projectField => _localizedValues[localeCode]!['project_field']!;

  String get taskField => _localizedValues[localeCode]!['task_field']!;

  String get groupField => _localizedValues[localeCode]!['group_field']!;

  String get general => _localizedValues[localeCode]!['general']!;

  String get numberPadding => _localizedValues[localeCode]!['number_padding']!;

  String get recurringPrefix =>
      _localizedValues[localeCode]!['recurring_prefix']!;

  String get resetCounter => _localizedValues[localeCode]!['reset_counter']!;

  String get nextReset => _localizedValues[localeCode]!['next_reset']!;

  String get credit => _localizedValues[localeCode]!['credit']!;

  String get credits => _localizedValues[localeCode]!['credits']!;

  String get customSurcharge =>
      _localizedValues[localeCode]!['invoice_surcharge']!;

  String get chargeTaxes => _localizedValues[localeCode]!['charge_taxes']!;

  String get companyField => _localizedValues[localeCode]!['company_field']!;

  String get companyValue => _localizedValues[localeCode]!['company_value']!;

  String get generatedNumbers =>
      _localizedValues[localeCode]!['generated_numbers']!;

  String get company => _localizedValues[localeCode]!['company']!;

  String get surchargeField =>
      _localizedValues[localeCode]!['surcharge_field']!;

  String get never => _localizedValues[localeCode]!['never']!;

  String get freqDaily => _localizedValues[localeCode]!['freq_daily']!;

  String get freqWeekly => _localizedValues[localeCode]!['freq_weekly']!;

  String get freqTwoWeeks => _localizedValues[localeCode]!['freq_two_weeks']!;

  String get freqFourWeeks => _localizedValues[localeCode]!['freq_four_weeks']!;

  String get freqMonthly => _localizedValues[localeCode]!['freq_monthly']!;

  String get freqTwoMonths => _localizedValues[localeCode]!['freq_two_months']!;

  String get freqThreeMonths =>
      _localizedValues[localeCode]!['freq_three_months']!;

  String get freqFourMonths =>
      _localizedValues[localeCode]!['freq_four_months']!;

  String get freqSixMonths => _localizedValues[localeCode]!['freq_six_months']!;

  String get freqAnnually => _localizedValues[localeCode]!['freq_annually']!;

  String get freqTwoYears => _localizedValues[localeCode]!['freq_two_years']!;

  String get freqThreeYears =>
      _localizedValues[localeCode]!['freq_three_years']!;

  String get workflowSettings =>
      _localizedValues[localeCode]!['workflow_settings']!;

  String get autoEmailInvoice =>
      _localizedValues[localeCode]!['auto_email_invoice']!;

  String get autoEmailInvoiceHelp =>
      _localizedValues[localeCode]!['auto_email_invoice_help']!;

  String get autoArchiveQuote =>
      _localizedValues[localeCode]!['auto_archive_quote']!;

  String get autoArchiveQuoteHelp =>
      _localizedValues[localeCode]!['auto_archive_quote_help']!;

  String get autoConvertQuote =>
      _localizedValues[localeCode]!['auto_convert_quote']!;

  String get autoConvertQuoteHelp =>
      _localizedValues[localeCode]!['auto_convert_quote_help']!;

  String get invoiceTerms => _localizedValues[localeCode]!['invoice_terms']!;

  String get invoiceFooter => _localizedValues[localeCode]!['invoice_footer']!;

  String get quoteTerms => _localizedValues[localeCode]!['quote_terms']!;

  String get quoteFooter => _localizedValues[localeCode]!['quote_footer']!;

  String get invoiceFields => _localizedValues[localeCode]!['invoice_fields']!;

  String get productFields => _localizedValues[localeCode]!['product_fields']!;

  String get quoteDesign => _localizedValues[localeCode]!['quote_design']!;

  String get pageSize => _localizedValues[localeCode]!['page_size']!;

  String get fontSize => _localizedValues[localeCode]!['font_size']!;

  String get primaryColor => _localizedValues[localeCode]!['primary_color']!;

  String get secondaryColor =>
      _localizedValues[localeCode]!['secondary_color']!;

  String get primaryFont => _localizedValues[localeCode]!['primary_font']!;

  String get secondaryFont => _localizedValues[localeCode]!['secondary_font']!;

  String get hidePaidToDate =>
      _localizedValues[localeCode]!['hide_paid_to_date']!;

  String get hidePaidToDateHelp =>
      _localizedValues[localeCode]!['hide_paid_to_date_help']!;

  String get invoiceEmbedDocuments =>
      _localizedValues[localeCode]!['invoice_embed_documents']!;

  String get invoiceEmbedDocumentsHelp =>
      _localizedValues[localeCode]!['invoice_embed_documents_help']!;

  String get allPagesHeader =>
      _localizedValues[localeCode]!['all_pages_header']!;

  String get allPagesFooter =>
      _localizedValues[localeCode]!['all_pages_footer']!;

  String get firstPage => _localizedValues[localeCode]!['first_page']!;

  String get allPages => _localizedValues[localeCode]!['all_pages']!;

  String get lastPage => _localizedValues[localeCode]!['last_page']!;

  String get generalSettings =>
      _localizedValues[localeCode]!['general_settings']!;

  String get invoiceOptions =>
      _localizedValues[localeCode]!['invoice_options']!;

  String get newUser => _localizedValues[localeCode]!['new_user']!;

  String get createdUser => _localizedValues[localeCode]!['created_user']!;

  String get updatedUser => _localizedValues[localeCode]!['updated_user']!;

  String get archivedUser => _localizedValues[localeCode]!['archived_user']!;

  String get deletedUser => _localizedValues[localeCode]!['deleted_user']!;

  String get removedUser => _localizedValues[localeCode]!['removed_user']!;

  String get restoredUser => _localizedValues[localeCode]!['restored_user']!;

  String get archivedUsers => _localizedValues[localeCode]!['archived_users']!;

  String get deletedUsers => _localizedValues[localeCode]!['deleted_users']!;

  String get removedUsers => _localizedValues[localeCode]!['removed_users']!;

  String get restoredUsers => _localizedValues[localeCode]!['restored_users']!;

  String get editUser => _localizedValues[localeCode]!['edit_user']!;

  String get users => _localizedValues[localeCode]!['users']!;

  String get userManagement =>
      _localizedValues[localeCode]!['user_management']!;

  String get administrator => _localizedValues[localeCode]!['administrator']!;

  String get administratorHelp =>
      _localizedValues[localeCode]!['administrator_help']!;

  String get filteredByUser =>
      _localizedValues[localeCode]!['filtered_by_user']!;

  String get endlessReminder =>
      _localizedValues[localeCode]!['endless_reminder']!;

  String get invoiceEmail => _localizedValues[localeCode]!['invoice_email']!;

  String get paymentEmail => _localizedValues[localeCode]!['payment_email']!;

  String get quoteEmail => _localizedValues[localeCode]!['quote_email']!;

  String get days => _localizedValues[localeCode]!['days']!;

  String get beforeDueDate => _localizedValues[localeCode]!['before_due_date']!;

  String get afterDueDate => _localizedValues[localeCode]!['after_due_date']!;

  String get afterInvoiceDate =>
      _localizedValues[localeCode]!['after_invoice_date']!;

  String get schedule => _localizedValues[localeCode]!['schedule']!;

  String get lateFeeAmount => _localizedValues[localeCode]!['late_fee_amount']!;

  String get lateFeePercent =>
      _localizedValues[localeCode]!['late_fee_percent']!;

  String get creditNumber => _localizedValues[localeCode]!['credit_number']!;

  String get paymentNumber => _localizedValues[localeCode]!['payment_number']!;

  String get lateFees => _localizedValues[localeCode]!['late_fees']!;

  String get recoverPassword =>
      _localizedValues[localeCode]!['recover_password']!;

  String get submit => _localizedValues[localeCode]!['submit']!;

  String get recoverPasswordEmailSent =>
      _localizedValues[localeCode]!['recover_password_email_sent']!;

  String get fieldType => _localizedValues[localeCode]!['field_type']!;

  String get singleLineText =>
      _localizedValues[localeCode]!['single_line_text']!;

  String get multiLineText => _localizedValues[localeCode]!['multi_line_text']!;

  String get dropdown => _localizedValues[localeCode]!['dropdown']!;

  String get options => _localizedValues[localeCode]!['options']!;

  String get commaSeparatedList =>
      _localizedValues[localeCode]!['comma_sparated_list']!;

  String get switchLabel => _localizedValues[localeCode]!['switch']!;

  String get accentColor => _localizedValues[localeCode]!['accent_color']!;

  String get taxSettings => _localizedValues[localeCode]!['tax_settings']!;

  String get configureRates =>
      _localizedValues[localeCode]!['configure_rates']!;

  String get configureGateways =>
      _localizedValues[localeCode]!['configure_gateways']!;

  String get taxSettingsRates =>
      _localizedValues[localeCode]!['tax_settings_rates']!;

  String get noClientSelected =>
      _localizedValues[localeCode]!['no_client_selected']!;

  String get invoiceTax => _localizedValues[localeCode]!['invoice_tax']!;

  String get lineItemTax => _localizedValues[localeCode]!['line_item_tax']!;

  String get inclusiveTaxes =>
      _localizedValues[localeCode]!['inclusive_taxes']!;

  String get invoiceTaxRates =>
      _localizedValues[localeCode]!['invoice_tax_rates']!;

  String get itemTaxRates => _localizedValues[localeCode]!['item_tax_rates']!;

  String get user => _localizedValues[localeCode]!['user']!;

  String get defaultTaxRate =>
      _localizedValues[localeCode]!['default_tax_rate']!;

  String get oneTaxRate => _localizedValues[localeCode]!['one_tax_rate']!;

  String get twoTaxRates => _localizedValues[localeCode]!['two_tax_rates']!;

  String get threeTaxRates => _localizedValues[localeCode]!['three_tax_rates']!;

  String get customValue1 => _localizedValues[localeCode]!['custom_value1']!;

  String get customValue2 => _localizedValues[localeCode]!['custom_value2']!;

  String get customValue3 => _localizedValues[localeCode]!['custom_value3']!;

  String get customValue4 => _localizedValues[localeCode]!['custom_value4']!;

  String get emailStyleCustom =>
      _localizedValues[localeCode]!['email_style_custom']!;

  String get customMessageDashboard =>
      _localizedValues[localeCode]!['custom_message_dashboard']!;

  String get customMessageUnpaidInvoice =>
      _localizedValues[localeCode]!['custom_message_unpaid_invoice']!;

  String get customMessagePaidInvoice =>
      _localizedValues[localeCode]!['custom_message_paid_invoice']!;

  String get customMessageUnapprovedQuote =>
      _localizedValues[localeCode]!['custom_message_unapproved_quote']!;

  String get lockInvoices => _localizedValues[localeCode]!['lock_invoices']!;

  String get translations => _localizedValues[localeCode]!['translations']!;

  String get taskNumberPattern =>
      _localizedValues[localeCode]!['task_number_pattern']!;

  String get taskNumberCounter =>
      _localizedValues[localeCode]!['task_number_counter']!;

  String get expenseNumberPattern =>
      _localizedValues[localeCode]!['expense_number_pattern']!;

  String get expenseNumberCounter =>
      _localizedValues[localeCode]!['expense_number_counter']!;

  String get vendorNumberPattern =>
      _localizedValues[localeCode]!['vendor_number_pattern']!;

  String get vendorNumberCounter =>
      _localizedValues[localeCode]!['vendor_number_counter']!;

  String get ticketNumberPattern =>
      _localizedValues[localeCode]!['ticket_number_pattern']!;

  String get ticketNumberCounter =>
      _localizedValues[localeCode]!['ticket_number_counter']!;

  String get paymentNumberPattern =>
      _localizedValues[localeCode]!['payment_number_pattern']!;

  String get paymentNumberCounter =>
      _localizedValues[localeCode]!['payment_number_counter']!;

  String get invoiceNumberPattern =>
      _localizedValues[localeCode]!['invoice_number_pattern']!;

  String get invoiceNumberCounter =>
      _localizedValues[localeCode]!['invoice_number_counter']!;

  String get quoteNumberPattern =>
      _localizedValues[localeCode]!['quote_number_pattern']!;

  String get quoteNumberCounter =>
      _localizedValues[localeCode]!['quote_number_counter']!;

  String get clientNumberPattern =>
      _localizedValues[localeCode]!['client_number_pattern']!;

  String get clientNumberCounter =>
      _localizedValues[localeCode]!['client_number_counter']!;

  String get creditNumberPattern =>
      _localizedValues[localeCode]!['credit_number_pattern']!;

  String get creditNumberCounter =>
      _localizedValues[localeCode]!['credit_number_counter']!;

  String get resetCounterDate =>
      _localizedValues[localeCode]!['reset_counter_date']!;

  String get counterPadding =>
      _localizedValues[localeCode]!['counter_padding']!;

  String get sharedInvoiceQuoteCounter =>
      _localizedValues[localeCode]!['shared_invoice_quote_counter']!;

  String get defaultTaxName1 =>
      _localizedValues[localeCode]!['default_tax_name_1']!;

  String get defaultTaxRate1 =>
      _localizedValues[localeCode]!['default_tax_rate_1']!;

  String get defaultTaxName2 =>
      _localizedValues[localeCode]!['default_tax_name_2']!;

  String get defaultTaxRate2 =>
      _localizedValues[localeCode]!['default_tax_rate_2']!;

  String get defaultTaxName3 =>
      _localizedValues[localeCode]!['default_tax_name_3']!;

  String get defaultTaxRate3 =>
      _localizedValues[localeCode]!['default_tax_rate_3']!;

  String get emailSubjectInvoice =>
      _localizedValues[localeCode]!['email_subject_invoice']!;

  String get emailSubjectQuote =>
      _localizedValues[localeCode]!['email_subject_quote']!;

  String get emailSubjectPayment =>
      _localizedValues[localeCode]!['email_subject_payment']!;

  String get emailSubjectPaymentPartial =>
      _localizedValues[localeCode]!['email_subject_payment_partial']!;

  String get showCost => _localizedValues[localeCode]!['show_cost']!;

  String get showProductCost =>
      _localizedValues[localeCode]!['show_product_cost']!;

  String get showCostHelp => _localizedValues[localeCode]!['show_cost_help']!;

  String get showInvoiceQuantity =>
      _localizedValues[localeCode]!['show_invoice_quantity']!;

  String get showProductQuantityHelp =>
      _localizedValues[localeCode]!['show_product_quantity_help']!;

  String get showProductQuantity =>
      _localizedValues[localeCode]!['show_product_quantity']!;

  String get showInvoiceQuantityHelp =>
      _localizedValues[localeCode]!['show_invoice_quantity_help']!;

  String get showProductDiscount =>
      _localizedValues[localeCode]!['show_product_discount']!;

  String get showProductDiscountHelp =>
      _localizedValues[localeCode]!['show_product_discount_help']!;

  String get defaultQuantity =>
      _localizedValues[localeCode]!['default_quantity']!;

  String get defaultTaskRate =>
      _localizedValues[localeCode]!['default_task_rate']!;

  String get defaultQuantityHelp =>
      _localizedValues[localeCode]!['default_quantity_help']!;

  String get firstCustom => _localizedValues[localeCode]!['first_custom']!;

  String get secondCustom => _localizedValues[localeCode]!['second_custom']!;

  String get thirdCustom => _localizedValues[localeCode]!['third_custom']!;

  String get module => _localizedValues[localeCode]!['module']!;

  String get view => _localizedValues[localeCode]!['view']!;

  String get layout => _localizedValues[localeCode]!['layout']!;

  String get mobile => _localizedValues[localeCode]!['mobile']!;

  String get desktop => _localizedValues[localeCode]!['desktop']!;

  String get tablet => _localizedValues[localeCode]!['tablet']!;

  String get float => _localizedValues[localeCode]!['float']!;

  String get collapse => _localizedValues[localeCode]!['collapse']!;

  String get showOrHide => _localizedValues[localeCode]!['show_or_hide']!;

  String get menuSidebar => _localizedValues[localeCode]!['menu_sidebar']!;

  String get historySidebar =>
      _localizedValues[localeCode]!['history_sidebar']!;

  String get selectCompany => _localizedValues[localeCode]!['select_company']!;

  String get newPayment => _localizedValues[localeCode]!['new_payment']!;

  String get showTable => _localizedValues[localeCode]!['show_table']!;

  String get showList => _localizedValues[localeCode]!['show_list']!;

  String get whenSaved => _localizedValues[localeCode]!['when_saved']!;

  String get whenSent => _localizedValues[localeCode]!['when_sent']!;

  String get generateNumber =>
      _localizedValues[localeCode]!['generate_number']!;

  String get yes => _localizedValues[localeCode]!['yes']!;

  String get no => _localizedValues[localeCode]!['no']!;

  String get deletedLogo => _localizedValues[localeCode]!['deleted_logo']!;

  String get pleaseEnterAValue =>
      _localizedValues[localeCode]!['please_enter_a_value']!;

  String get clientPortalTasks =>
      _localizedValues[localeCode]!['client_portal_tasks']!;

  String get clientPortalDashboard =>
      _localizedValues[localeCode]!['client_portal_dashboard']!;

  String get passwordIsTooEasy =>
      _localizedValues[localeCode]!['password_is_too_easy']!;

  String get iFrameUrl => _localizedValues[localeCode]!['iframe_url']!;

  String get domainUrl => _localizedValues[localeCode]!['domain_url']!;

  String get creditEmail => _localizedValues[localeCode]!['credit_email']!;

  String get item => _localizedValues[localeCode]!['item']!;

  String get lineTotal => _localizedValues[localeCode]!['line_total']!;

  String get calculateSubtotal => _localizedValues[localeCode]!['subtotal']!;

  String get contactUs => _localizedValues[localeCode]!['contact_us']!;

  String get documentation => _localizedValues[localeCode]!['documentation']!;

  String get about => _localizedValues[localeCode]!['about']!;

  String get supportForum => _localizedValues[localeCode]!['support_forum']!;

  String get configureSettings =>
      _localizedValues[localeCode]!['configure_settings']!;

  String get adjustFeePercent =>
      _localizedValues[localeCode]!['adjust_fee_percent']!;

  String get adjustFeePercentHelp =>
      _localizedValues[localeCode]!['adjust_fee_percent_help']!;

  String get pdfMinRequirements =>
      _localizedValues[localeCode]!['pdf_min_requirements']!;

  String get showProductDetails =>
      _localizedValues[localeCode]!['show_product_details']!;

  String get showProductDetailsHelp =>
      _localizedValues[localeCode]!['show_product_details_help']!;

  String get from => _localizedValues[localeCode]!['from']!;

  String get message => _localizedValues[localeCode]!['message']!;

  String get yourMessageHasBeenReceived =>
      _localizedValues[localeCode]!['your_message_has_been_received']!;

  String get includeRecentErrors =>
      _localizedValues[localeCode]!['include_recent_errors']!;

  String get applied => _localizedValues[localeCode]!['applied']!;

  String get verifyPassword =>
      _localizedValues[localeCode]!['verify_password']!;

  String get entityState => _localizedValues[localeCode]!['entity_state']!;

  String get multiselect => _localizedValues[localeCode]!['multiselect']!;

  String get contactEmail => _localizedValues[localeCode]!['contact_email']!;

  String get filteredBy => _localizedValues[localeCode]!['filtered_by']!;

  String get refund => _localizedValues[localeCode]!['refund']!;

  String get refundDate => _localizedValues[localeCode]!['refund_date']!;

  String get help => _localizedValues[localeCode]!['help']!;

  String get unpaidInvoice => _localizedValues[localeCode]!['unpaid_invoice']!;

  String get paidInvoice => _localizedValues[localeCode]!['paid_invoice']!;

  String get unapprovedQuote =>
      _localizedValues[localeCode]!['unapproved_quote']!;

  String get addCompany => _localizedValues[localeCode]!['add_company']!;

  String get reports => _localizedValues[localeCode]!['reports']!;

  String get report => _localizedValues[localeCode]!['report']!;

  String get aging => _localizedValues[localeCode]!['aging']!;

  String get columns => _localizedValues[localeCode]!['columns']!;

  String get profitAndLoss => _localizedValues[localeCode]!['profit_and_loss']!;

  String get editColumns => _localizedValues[localeCode]!['edit_columns']!;

  String get addColumn => _localizedValues[localeCode]!['add_column']!;

  String get assignedTo => _localizedValues[localeCode]!['assigned_to']!;

  String get createdBy => _localizedValues[localeCode]!['created_by']!;

  String get assignedTId => _localizedValues[localeCode]!['assigned_to_id']!;

  String get createdById => _localizedValues[localeCode]!['created_by_id']!;

  String get clientId => _localizedValues[localeCode]!['client_id']!;

  String get shippingAddress1 =>
      _localizedValues[localeCode]!['shipping_address1']!;

  String get shippingAddress2 =>
      _localizedValues[localeCode]!['shipping_address2']!;

  String get shippingCity => _localizedValues[localeCode]!['shipping_city']!;

  String get shippingState => _localizedValues[localeCode]!['shipping_state']!;

  String get shippingPostalCode =>
      _localizedValues[localeCode]!['shipping_postal_code']!;

  String get shippingCountry =>
      _localizedValues[localeCode]!['shipping_country']!;

  String get billingAddress1 =>
      _localizedValues[localeCode]!['billing_address1']!;

  String get billingAddress2 =>
      _localizedValues[localeCode]!['billing_address2']!;

  String get billingCity => _localizedValues[localeCode]!['billing_city']!;

  String get billingState => _localizedValues[localeCode]!['billing_state']!;

  String get billingPostalCode =>
      _localizedValues[localeCode]!['billing_postal_code']!;

  String get billingCountry =>
      _localizedValues[localeCode]!['billing_country']!;

  String get contactFullName =>
      _localizedValues[localeCode]!['contact_full_name']!;

  String get contactPhone => _localizedValues[localeCode]!['contact_phone']!;

  String get contactCustomValue1 =>
      _localizedValues[localeCode]!['contact_custom_value1']!;

  String get contactCustomValue2 =>
      _localizedValues[localeCode]!['contact_custom_value2']!;

  String get contactCustomValue3 =>
      _localizedValues[localeCode]!['contact_custom_value3']!;

  String get contactCustomValue4 =>
      _localizedValues[localeCode]!['contact_custom_value4']!;

  String get creditBalance => _localizedValues[localeCode]!['credit_balance']!;

  String get contactLastLogin =>
      _localizedValues[localeCode]!['contact_last_login']!;

  String get groupBy => _localizedValues[localeCode]!['group_by']!;

  String get isActive => _localizedValues[localeCode]!['is_active']!;

  String get subgroup => _localizedValues[localeCode]!['subgroup']!;

  String get day => _localizedValues[localeCode]!['day']!;

  String get month => _localizedValues[localeCode]!['month']!;

  String get year => _localizedValues[localeCode]!['year']!;

  String get blank => _localizedValues[localeCode]!['blank']!;

  String get count => _localizedValues[localeCode]!['count']!;

  String get chart => _localizedValues[localeCode]!['chart']!;

  String get export => _localizedValues[localeCode]!['export']!;

  String get number => _localizedValues[localeCode]!['number']!;

  String get reset => _localizedValues[localeCode]!['reset']!;

  String get client1 => _localizedValues[localeCode]!['client1']!;

  String get client2 => _localizedValues[localeCode]!['client2']!;

  String get client3 => _localizedValues[localeCode]!['client3']!;

  String get client4 => _localizedValues[localeCode]!['client4']!;

  String get company1 => _localizedValues[localeCode]!['company1']!;

  String get company2 => _localizedValues[localeCode]!['company2']!;

  String get company3 => _localizedValues[localeCode]!['company3']!;

  String get company4 => _localizedValues[localeCode]!['company4']!;

  String get product1 => _localizedValues[localeCode]!['product1']!;

  String get product2 => _localizedValues[localeCode]!['product2']!;

  String get product3 => _localizedValues[localeCode]!['product3']!;

  String get product4 => _localizedValues[localeCode]!['product4']!;

  String get product5 => lookup('product5');

  String get product6 => lookup('product6');

  String get product7 => lookup('product7');

  String get product8 => lookup('product8');

  String get contact1 => _localizedValues[localeCode]!['contact1']!;

  String get contact2 => _localizedValues[localeCode]!['contact2']!;

  String get contact3 => _localizedValues[localeCode]!['contact3']!;

  String get contact4 => _localizedValues[localeCode]!['contact4']!;

  String get task1 => _localizedValues[localeCode]!['task1']!;

  String get task2 => _localizedValues[localeCode]!['task2']!;

  String get task3 => _localizedValues[localeCode]!['task3']!;

  String get task4 => _localizedValues[localeCode]!['task4']!;

  String get project1 => _localizedValues[localeCode]!['project1']!;

  String get project2 => _localizedValues[localeCode]!['project2']!;

  String get project3 => _localizedValues[localeCode]!['project3']!;

  String get project4 => _localizedValues[localeCode]!['project4']!;

  String get expense1 => _localizedValues[localeCode]!['expense1']!;

  String get expense2 => _localizedValues[localeCode]!['expense2']!;

  String get expense3 => _localizedValues[localeCode]!['expense3']!;

  String get expense4 => _localizedValues[localeCode]!['expense4']!;

  String get vendor1 => _localizedValues[localeCode]!['vendor1']!;

  String get vendor2 => _localizedValues[localeCode]!['vendor2']!;

  String get vendor3 => _localizedValues[localeCode]!['vendor3']!;

  String get vendor4 => _localizedValues[localeCode]!['vendor4']!;

  String get invoice1 => _localizedValues[localeCode]!['invoice1']!;

  String get invoice2 => _localizedValues[localeCode]!['invoice2']!;

  String get invoice3 => _localizedValues[localeCode]!['invoice3']!;

  String get invoice4 => _localizedValues[localeCode]!['invoice4']!;

  String get invoice5 => lookup('invoice5');

  String get invoice6 => lookup('invoice6');

  String get invoice7 => lookup('invoice7');

  String get invoice8 => lookup('invoice8');

  String get payment1 => _localizedValues[localeCode]!['payment1']!;

  String get payment2 => _localizedValues[localeCode]!['payment2']!;

  String get payment3 => _localizedValues[localeCode]!['payment3']!;

  String get payment4 => _localizedValues[localeCode]!['payment4']!;

  String get surcharge1 => _localizedValues[localeCode]!['surcharge1']!;

  String get surcharge2 => _localizedValues[localeCode]!['surcharge2']!;

  String get surcharge3 => _localizedValues[localeCode]!['surcharge3']!;

  String get surcharge4 => _localizedValues[localeCode]!['surcharge4']!;

  String get group1 => _localizedValues[localeCode]!['group1']!;

  String get group2 => _localizedValues[localeCode]!['group2']!;

  String get group3 => _localizedValues[localeCode]!['group3']!;

  String get group4 => _localizedValues[localeCode]!['group4']!;

  String get addedCompany => _localizedValues[localeCode]!['added_company']!;

  String get newCompany => _localizedValues[localeCode]!['new_company']!;

  String get creditFooter => _localizedValues[localeCode]!['credit_footer']!;

  String get creditTerms => _localizedValues[localeCode]!['credit_terms']!;

  String get slackWebhookUrl =>
      _localizedValues[localeCode]!['slack_webhook_url']!;

  String get trackingId => _localizedValues[localeCode]!['tracking_id']!;

  String get integrations => _localizedValues[localeCode]!['integrations']!;

  String get learnMore => _localizedValues[localeCode]!['learn_more']!;

  String get updateAvailable =>
      _localizedValues[localeCode]!['update_available']!;

  String get aNewVersionIsAvailable =>
      _localizedValues[localeCode]!['a_new_version_is_available']!;

  String get updateNow => _localizedValues[localeCode]!['update_now']!;

  String get currentVersion =>
      _localizedValues[localeCode]!['current_version']!;

  String get latestVersion => _localizedValues[localeCode]!['latest_version']!;

  String get appUpdated => _localizedValues[localeCode]!['app_updated']!;

  String get taskStatus => _localizedValues[localeCode]!['task_status']!;

  String get taskStatuses => _localizedValues[localeCode]!['task_statuses']!;

  String get newTaskStatus => _localizedValues[localeCode]!['new_task_status']!;

  String get createdTaskStatus =>
      _localizedValues[localeCode]!['created_task_status']!;

  String get updatedTaskStatus =>
      _localizedValues[localeCode]!['updated_task_status']!;

  String get archivedTaskStatus =>
      _localizedValues[localeCode]!['archived_task_status']!;

  String get deletedTaskStatus =>
      _localizedValues[localeCode]!['deleted_task_status']!;

  String get restoredTaskStatus =>
      _localizedValues[localeCode]!['restored_task_status']!;

  String get archivedTaskStatuses =>
      _localizedValues[localeCode]!['archived_task_statuses']!;

  String get deletedTaskStatuses =>
      _localizedValues[localeCode]!['deleted_task_statuses']!;

  String get restoredTaskStatuses =>
      _localizedValues[localeCode]!['restored_task_statuses']!;

  String get editTaskStatus =>
      _localizedValues[localeCode]!['edit_task_status']!;

  String get searchTaskStatus =>
      _localizedValues[localeCode]!['search_task_status']!;

  String get expenseTotal => _localizedValues[localeCode]!['expense_total']!;

  String get expenseCategory =>
      _localizedValues[localeCode]!['expense_category']!;

  String get expenseCategories =>
      _localizedValues[localeCode]!['expense_categories']!;

  String get newExpenseCategory =>
      _localizedValues[localeCode]!['new_expense_category']!;

  String get createdExpenseCategory =>
      _localizedValues[localeCode]!['created_expense_category']!;

  String get updatedExpenseCategory =>
      _localizedValues[localeCode]!['updated_expense_category']!;

  String get archivedExpenseCategory =>
      _localizedValues[localeCode]!['archived_expense_category']!;

  String get deletedExpenseCategory =>
      _localizedValues[localeCode]!['deleted_expense_category']!;

  String get restoredExpenseCategory =>
      _localizedValues[localeCode]!['restored_expense_category']!;

  String get archivedExpenseCategories =>
      _localizedValues[localeCode]!['archived_expense_categories']!;

  String get deletedExpenseCategories =>
      _localizedValues[localeCode]!['deleted_expense_categories']!;

  String get restoredExpenseCategories =>
      _localizedValues[localeCode]!['restored_expense_categories']!;

  String get editExpenseCategory =>
      _localizedValues[localeCode]!['edit_expense_category']!;

  String get searchExpenseCategory =>
      _localizedValues[localeCode]!['search_expense_category']!;

  String get recurringInvoice =>
      _localizedValues[localeCode]!['recurring_invoice']!;

  String get recurringInvoices =>
      _localizedValues[localeCode]!['recurring_invoices']!;

  String get newRecurringInvoice =>
      _localizedValues[localeCode]!['new_recurring_invoice']!;

  String get createdRecurringInvoice =>
      _localizedValues[localeCode]!['created_recurring_invoice']!;

  String get updatedRecurringInvoice =>
      _localizedValues[localeCode]!['updated_recurring_invoice']!;

  String get archivedRecurringInvoice =>
      _localizedValues[localeCode]!['archived_recurring_invoice']!;

  String get deletedRecurringInvoice =>
      _localizedValues[localeCode]!['deleted_recurring_invoice']!;

  String get restoredRecurringInvoice =>
      _localizedValues[localeCode]!['restored_recurring_invoice']!;

  String get archivedRecurringInvoices =>
      _localizedValues[localeCode]!['archived_recurring_invoices']!;

  String get deletedRecurringInvoices =>
      _localizedValues[localeCode]!['deleted_recurring_invoices']!;

  String get restoredRecurringInvoices =>
      _localizedValues[localeCode]!['restored_recurring_invoices']!;

  String get stoppedRecurringInvoice =>
      _localizedValues[localeCode]!['stopped_recurring_invoice']!;

  String get startedRecurringInvoice =>
      _localizedValues[localeCode]!['started_recurring_invoice']!;

  String get resumedRecurringInvoice =>
      _localizedValues[localeCode]!['resumed_recurring_invoice']!;

  String get searchRecurringInvoice =>
      _localizedValues[localeCode]!['search_recurring_invoice']!;

  String get webhook => _localizedValues[localeCode]!['webhook']!;

  String get webhooks => _localizedValues[localeCode]!['webhooks']!;

  String get newWebhook => _localizedValues[localeCode]!['new_webhook']!;

  String get createdWebhook =>
      _localizedValues[localeCode]!['created_webhook']!;

  String get updatedWebhook =>
      _localizedValues[localeCode]!['updated_webhook']!;

  String get archivedWebhook =>
      _localizedValues[localeCode]!['archived_webhook']!;

  String get deletedWebhook =>
      _localizedValues[localeCode]!['deleted_webhook']!;

  String get restoredWebhook =>
      _localizedValues[localeCode]!['restored_webhook']!;

  String get archivedWebhooks =>
      _localizedValues[localeCode]!['archived_webhooks']!;

  String get deletedWebhooks =>
      _localizedValues[localeCode]!['deleted_webhooks']!;

  String get restoredWebhooks =>
      _localizedValues[localeCode]!['restored_webhooks']!;

  String get editWebhook => _localizedValues[localeCode]!['edit_webhook']!;

  String get token => _localizedValues[localeCode]!['token']!;

  String get tokens => _localizedValues[localeCode]!['tokens']!;

  String get newToken => _localizedValues[localeCode]!['new_token']!;

  String get createdToken => _localizedValues[localeCode]!['created_token']!;

  String get updatedToken => _localizedValues[localeCode]!['updated_token']!;

  String get archivedToken => _localizedValues[localeCode]!['archived_token']!;

  String get deletedToken => _localizedValues[localeCode]!['deleted_token']!;

  String get restoredToken => _localizedValues[localeCode]!['restored_token']!;

  String get archivedTokens =>
      _localizedValues[localeCode]!['archived_tokens']!;

  String get deletedTokens => _localizedValues[localeCode]!['deleted_tokens']!;

  String get restoredTokens =>
      _localizedValues[localeCode]!['restored_tokens']!;

  String get editToken => _localizedValues[localeCode]!['edit_token']!;

  String get paymentTerm => _localizedValues[localeCode]!['payment_term']!;

  String get newPaymentTerm =>
      _localizedValues[localeCode]!['new_payment_term']!;

  String get createdPaymentTerm =>
      _localizedValues[localeCode]!['created_payment_term']!;

  String get updatedPaymentTerm =>
      _localizedValues[localeCode]!['updated_payment_term']!;

  String get archivedPaymentTerm =>
      _localizedValues[localeCode]!['archived_payment_term']!;

  String get deletedPaymentTerm =>
      _localizedValues[localeCode]!['deleted_payment_term']!;

  String get restoredPaymentTerm =>
      _localizedValues[localeCode]!['restored_payment_term']!;

  String get archivedPaymentTerms =>
      _localizedValues[localeCode]!['archived_payment_terms']!;

  String get deletedPaymentTerms =>
      _localizedValues[localeCode]!['deleted_payment_terms']!;

  String get restoredPaymentTerms =>
      _localizedValues[localeCode]!['restored_payment_terms']!;

  String get editPaymentTerm =>
      _localizedValues[localeCode]!['edit_payment_term']!;

  String get designs => _localizedValues[localeCode]!['designs']!;

  String get newDesign => _localizedValues[localeCode]!['new_design']!;

  String get createdDesign => _localizedValues[localeCode]!['created_design']!;

  String get updatedDesign => _localizedValues[localeCode]!['updated_design']!;

  String get archivedDesign =>
      _localizedValues[localeCode]!['archived_design']!;

  String get deletedDesign => _localizedValues[localeCode]!['deleted_design']!;

  String get restoredDesign =>
      _localizedValues[localeCode]!['restored_design']!;

  String get archivedDesigns =>
      _localizedValues[localeCode]!['archived_designs']!;

  String get deletedDesigns =>
      _localizedValues[localeCode]!['deleted_designs']!;

  String get restoredDesigns =>
      _localizedValues[localeCode]!['restored_designs']!;

  String get editDesign => _localizedValues[localeCode]!['edit_design']!;

  String get newCredit => _localizedValues[localeCode]!['new_credit']!;

  String get createdCredit => _localizedValues[localeCode]!['created_credit']!;

  String get updatedCredit => _localizedValues[localeCode]!['updated_credit']!;

  String get archivedCredit =>
      _localizedValues[localeCode]!['archived_credit']!;

  String get deletedCredit => _localizedValues[localeCode]!['deleted_credit']!;

  String get restoredCredit =>
      _localizedValues[localeCode]!['restored_credit']!;

  String get archivedCredits =>
      _localizedValues[localeCode]!['archived_credits']!;

  String get deletedCredits =>
      _localizedValues[localeCode]!['deleted_credits']!;

  String get restoredCredits =>
      _localizedValues[localeCode]!['restored_credits']!;

  String get creditDate => _localizedValues[localeCode]!['credit_date']!;

  String get accountManagement =>
      _localizedValues[localeCode]!['account_management']!;

  String get proposals => _localizedValues[localeCode]!['proposals']!;

  String get tickets => _localizedValues[localeCode]!['tickets']!;

  String get recurringQuotes =>
      _localizedValues[localeCode]!['recurring_quotes']!;

  String get recurringTasks =>
      _localizedValues[localeCode]!['recurring_tasks']!;

  String get recurringExpenses =>
      _localizedValues[localeCode]!['recurring_expenses']!;

  String get customDesigns => _localizedValues[localeCode]!['custom_designs']!;

  String get cssFramework => _localizedValues[localeCode]!['css_framework']!;

  String get loadDesign => _localizedValues[localeCode]!['load_design']!;

  String get header => _localizedValues[localeCode]!['header']!;

  String get includes => _localizedValues[localeCode]!['includes']!;

  String get creditDesign => _localizedValues[localeCode]!['credit_design']!;

  String get partialPaymentEmail =>
      _localizedValues[localeCode]!['partial_payment_email']!;

  String get partialPayment =>
      _localizedValues[localeCode]!['partial_payment']!;

  String get convertedQuote =>
      _localizedValues[localeCode]!['converted_quote']!;

  String get enabledModules =>
      _localizedValues[localeCode]!['enabled_modules']!;

  String get cancelAccount => _localizedValues[localeCode]!['cancel_account']!;

  String get cancelAccountMessage =>
      _localizedValues[localeCode]!['cancel_account_message']!;

  String get deleteCompany => _localizedValues[localeCode]!['delete_company']!;

  String get deleteCompanyMessage =>
      _localizedValues[localeCode]!['delete_company_message']!;

  String get purchaseLicense =>
      _localizedValues[localeCode]!['purchase_license']!;

  String get applyLicense => _localizedValues[localeCode]!['apply_license']!;

  String get receiveAllNotifications =>
      _localizedValues[localeCode]!['receive_all_notifications']!;

  String get invoiceSent => _localizedValues[localeCode]!['invoice_sent']!;

  String get invoiceViewed => _localizedValues[localeCode]!['invoice_viewed']!;

  String get paymentSuccess =>
      _localizedValues[localeCode]!['payment_success']!;

  String get paymentFailure =>
      _localizedValues[localeCode]!['payment_failure']!;

  String get quoteSent => _localizedValues[localeCode]!['quote_sent']!;

  String get quoteViewed => _localizedValues[localeCode]!['quote_viewed']!;

  String get quoteApproved => _localizedValues[localeCode]!['quote_approved']!;

  String get creditSent => _localizedValues[localeCode]!['credit_sent']!;

  String get creditViewed => _localizedValues[localeCode]!['credit_viewed']!;

  String get none => _localizedValues[localeCode]!['none']!;

  String get owned => _localizedValues[localeCode]!['owned']!;

  String get permissions => _localizedValues[localeCode]!['permissions']!;

  String get allEvents => _localizedValues[localeCode]!['all_events']!;

  String get addField => _localizedValues[localeCode]!['add_field']!;

  String get clientDetails => _localizedValues[localeCode]!['client_details']!;

  String get companyAddress =>
      _localizedValues[localeCode]!['company_address']!;

  String get invoiceDetails =>
      _localizedValues[localeCode]!['invoice_details']!;

  String get quoteDetails => _localizedValues[localeCode]!['quote_details']!;

  String get creditDetails => _localizedValues[localeCode]!['credit_details']!;

  String get productColumns =>
      _localizedValues[localeCode]!['product_columns']!;

  String get taskColumns => _localizedValues[localeCode]!['task_columns']!;

  String get cloneToCredit => _localizedValues[localeCode]!['clone_to_credit']!;

  String get savedDesign => _localizedValues[localeCode]!['saved_design']!;

  String get refresh => _localizedValues[localeCode]!['refresh']!;

  String get clientCity => _localizedValues[localeCode]!['client_city']!;

  String get clientState => _localizedValues[localeCode]!['client_state']!;

  String get clientCountry => _localizedValues[localeCode]!['client_country']!;

  String get clientIsActive =>
      _localizedValues[localeCode]!['client_is_active']!;

  String get clientBalance => _localizedValues[localeCode]!['client_balance']!;

  String get clientAddress1 =>
      _localizedValues[localeCode]!['client_address1']!;

  String get clientAddress2 =>
      _localizedValues[localeCode]!['client_address2']!;

  String get vendorAddress1 =>
      _localizedValues[localeCode]!['vendor_address1']!;

  String get vendorAddress2 =>
      _localizedValues[localeCode]!['vendor_address2']!;

  String get type => _localizedValues[localeCode]!['type']!;

  String get importType => _localizedValues[localeCode]!['import_type']!;

  String get import => _localizedValues[localeCode]!['import']!;

  String get invoiceAmount => _localizedValues[localeCode]!['invoice_amount']!;

  String get invoiceDueDate =>
      _localizedValues[localeCode]!['invoice_due_date']!;

  String get taxRate1 => _localizedValues[localeCode]!['tax_rate1']!;

  String get taxRate2 => _localizedValues[localeCode]!['tax_rate2']!;

  String get taxRate3 => _localizedValues[localeCode]!['tax_rate3']!;

  String get autoBill => _localizedValues[localeCode]!['auto_bill']!;

  String get archivedAt => _localizedValues[localeCode]!['archived_at']!;

  String get hasExpenses => _localizedValues[localeCode]!['has_expenses']!;

  String get customTaxes1 => _localizedValues[localeCode]!['custom_taxes1']!;

  String get customTaxes2 => _localizedValues[localeCode]!['custom_taxes2']!;

  String get customTaxes3 => _localizedValues[localeCode]!['custom_taxes3']!;

  String get customTaxes4 => _localizedValues[localeCode]!['custom_taxes4']!;

  String get customSurcharge1 =>
      _localizedValues[localeCode]!['custom_surcharge1']!;

  String get customSurcharge2 =>
      _localizedValues[localeCode]!['custom_surcharge2']!;

  String get customSurcharge3 =>
      _localizedValues[localeCode]!['custom_surcharge3']!;

  String get customSurcharge4 =>
      _localizedValues[localeCode]!['custom_surcharge4']!;

  String get isDeleted => _localizedValues[localeCode]!['is_deleted']!;

  String get vendorCity => _localizedValues[localeCode]!['vendor_city']!;

  String get vendorState => _localizedValues[localeCode]!['vendor_state']!;

  String get vendorCountry => _localizedValues[localeCode]!['vendor_country']!;

  String get isApproved => _localizedValues[localeCode]!['is_approved']!;

  String get taxName => _localizedValues[localeCode]!['tax_name']!;

  String get taxAmount => _localizedValues[localeCode]!['tax_amount']!;

  String get taxPaid => _localizedValues[localeCode]!['tax_paid']!;

  String get paymentAmount => _localizedValues[localeCode]!['payment_amount']!;

  String get age => _localizedValues[localeCode]!['age']!;

  String get ageGroup0 => _localizedValues[localeCode]!['age_group_0']!;

  String get ageGroup30 => _localizedValues[localeCode]!['age_group_30']!;

  String get ageGroup60 => _localizedValues[localeCode]!['age_group_60']!;

  String get ageGroup90 => _localizedValues[localeCode]!['age_group_90']!;

  String get ageGroup120 => _localizedValues[localeCode]!['age_group_120']!;

  String get invoiceBalance =>
      _localizedValues[localeCode]!['invoice_balance']!;

  String get purgeData => _localizedValues[localeCode]!['purge_data']!;

  String get purgeSuccessful =>
      _localizedValues[localeCode]!['purge_successful']!;

  String get purgeDataMessage =>
      _localizedValues[localeCode]!['purge_data_message']!;

  String get license => _localizedValues[localeCode]!['license']!;

  String get optional => _localizedValues[localeCode]!['optional']!;

  String get custom1 => _localizedValues[localeCode]!['custom1']!;

  String get custom2 => _localizedValues[localeCode]!['custom2']!;

  String get custom3 => _localizedValues[localeCode]!['custom3']!;

  String get custom4 => _localizedValues[localeCode]!['custom4']!;

  String get fullName => _localizedValues[localeCode]!['full_name']!;

  String get cityStatePostal =>
      _localizedValues[localeCode]!['city_state_postal']!;

  String get postalCityState =>
      _localizedValues[localeCode]!['postal_city_state']!;

  String get reverse => _localizedValues[localeCode]!['reverse']!;

  String get cancelledInvoice =>
      _localizedValues[localeCode]!['cancelled_invoice']!;

  String get cancelledInvoices =>
      _localizedValues[localeCode]!['cancelled_invoices']!;

  String get reversedInvoice =>
      _localizedValues[localeCode]!['reversed_invoice']!;

  String get reversedInvoices =>
      _localizedValues[localeCode]!['reversed_invoices']!;

  String get refundPayment => _localizedValues[localeCode]!['refund_payment']!;

  String get searchInvoices =>
      _localizedValues[localeCode]!['search_invoices']!;

  String get searchClients => _localizedValues[localeCode]!['search_clients']!;

  String get searchProducts =>
      _localizedValues[localeCode]!['search_products']!;

  String get searchQuotes => _localizedValues[localeCode]!['search_quotes']!;

  String get searchCredits => _localizedValues[localeCode]!['search_credits']!;

  String get searchVendors => _localizedValues[localeCode]!['search_vendors']!;

  String get searchUsers => _localizedValues[localeCode]!['search_users']!;

  String get searchTaxRates =>
      _localizedValues[localeCode]!['search_tax_rates']!;

  String get searchTasks => _localizedValues[localeCode]!['search_tasks']!;

  String get searchSettings =>
      _localizedValues[localeCode]!['search_settings']!;

  String get searchProjects =>
      _localizedValues[localeCode]!['search_projects']!;

  String get searchExpenses =>
      _localizedValues[localeCode]!['search_expenses']!;

  String get searchPayments =>
      _localizedValues[localeCode]!['search_payments']!;

  String get searchGroups => _localizedValues[localeCode]!['search_groups']!;

  String get searchCompany => _localizedValues[localeCode]!['search_company']!;

  String get searchDocuments =>
      _localizedValues[localeCode]!['search_documents']!;

  String get searchDesigns => _localizedValues[localeCode]!['search_designs']!;

  String get searchInvoice => _localizedValues[localeCode]!['search_invoice']!;

  String get searchClient => _localizedValues[localeCode]!['search_client']!;

  String get searchProduct => _localizedValues[localeCode]!['search_product']!;

  String get searchQuote => _localizedValues[localeCode]!['search_quote']!;

  String get searchCredit => _localizedValues[localeCode]!['search_credit']!;

  String get searchVendor => _localizedValues[localeCode]!['search_vendor']!;

  String get searchUser => _localizedValues[localeCode]!['search_user']!;

  String get searchTaxRate => _localizedValues[localeCode]!['search_tax_rate']!;

  String get searchTask => _localizedValues[localeCode]!['search_task']!;

  String get searchProject => _localizedValues[localeCode]!['search_project']!;

  String get searchExpense => _localizedValues[localeCode]!['search_expense']!;

  String get searchPayment => _localizedValues[localeCode]!['search_payment']!;

  String get searchGroup => _localizedValues[localeCode]!['search_group']!;

  String get searchDocument =>
      _localizedValues[localeCode]!['search_document']!;

  String get searchDesign => _localizedValues[localeCode]!['search_design']!;

  String get searchToken => _localizedValues[localeCode]!['search_token']!;

  String get searchWebhook => _localizedValues[localeCode]!['search_webhook']!;

  String get partiallyRefunded =>
      _localizedValues[localeCode]!['partially_refunded']!;

  String get hideMenu => _localizedValues[localeCode]!['hide_menu']!;

  String get showMenu => _localizedValues[localeCode]!['show_menu']!;

  String get exclusive => _localizedValues[localeCode]!['exclusive']!;

  String get inclusive => _localizedValues[localeCode]!['inclusive']!;

  String get hosted => _localizedValues[localeCode]!['hosted']!;

  String get selfhosted => _localizedValues[localeCode]!['selfhosted']!;

  String get creditAmount => _localizedValues[localeCode]!['credit_amount']!;

  String get quoteAmount => _localizedValues[localeCode]!['quote_amount']!;

  String get reversed => _localizedValues[localeCode]!['reversed']!;

  String get cancelled => _localizedValues[localeCode]!['cancelled']!;

  String get sendFromGmail => _localizedValues[localeCode]!['send_from_gmail']!;

  String get changeToMobileLayout =>
      _localizedValues[localeCode]!['change_to_mobile_layout']!;

  String get changeToDekstopLayout =>
      _localizedValues[localeCode]!['change_to_desktop_layout']!;

  String get change => _localizedValues[localeCode]!['change']!;

  String get emailSignIn => _localizedValues[localeCode]!['email_sign_in']!;

  String get configurePaymentTerms =>
      _localizedValues[localeCode]!['configure_payment_terms']!;

  String get numberOfDays => _localizedValues[localeCode]!['number_of_days']!;

  String get reminderEndless =>
      _localizedValues[localeCode]!['reminder_endless']!;

  String get useDefault => _localizedValues[localeCode]!['use_default']!;

  String get contactName => _localizedValues[localeCode]!['contact_name']!;

  String get creditRemaining =>
      _localizedValues[localeCode]!['credit_remaining']!;

  String get allRecords => _localizedValues[localeCode]!['all_records']!;

  String get ownedByUser => _localizedValues[localeCode]!['owned_by_user']!;

  String get viewPdf => _localizedValues[localeCode]!['view_pdf']!;

  String get ledger => _localizedValues[localeCode]!['ledger']!;

  String get clientEmailNotSet =>
      _localizedValues[localeCode]!['client_email_not_set']!;

  String get emailInvoice => _localizedValues[localeCode]!['email_invoice']!;

  String get emailQuote => _localizedValues[localeCode]!['email_quote']!;

  String get emailCredit => _localizedValues[localeCode]!['email_credit']!;

  String get emailPayment => _localizedValues[localeCode]!['email_payment']!;

  String get clientRegistration =>
      _localizedValues[localeCode]!['client_registration']!;

  String get clientRegistrationHelp =>
      _localizedValues[localeCode]!['client_registration_help']!;

  String get documentUpload =>
      _localizedValues[localeCode]!['document_upload']!;

  String get documentUploadHelp =>
      _localizedValues[localeCode]!['document_upload_help']!;

  String get subtotal => _localizedValues[localeCode]!['subtotal']!;

  String get searchTokens => _localizedValues[localeCode]!['search_tokens']!;

  String get searchWebhooks =>
      _localizedValues[localeCode]!['search_webhooks']!;

  String get apiTokens => _localizedValues[localeCode]!['api_tokens']!;

  String get apiDocs => _localizedValues[localeCode]!['api_docs']!;

  String get apiWebhooks => _localizedValues[localeCode]!['api_webhooks']!;

  String get cronsNotEnabled =>
      _localizedValues[localeCode]!['crons_not_enabled']!;

  String get mustBeOnline => _localizedValues[localeCode]!['must_be_online']!;

  String get copy => _localizedValues[localeCode]!['copy']!;

  String get targetUrl => _localizedValues[localeCode]!['target_url']!;

  String get eventType => _localizedValues[localeCode]!['event_type']!;

  String get showSidebar => _localizedValues[localeCode]!['show_sidebar']!;

  String get hideSidebar => _localizedValues[localeCode]!['hide_sidebar']!;

  String get plan => _localizedValues[localeCode]!['plan']!;

  String get free => _localizedValues[localeCode]!['free']!;

  String get expiresOn => _localizedValues[localeCode]!['expires_on']!;

  String get off => _localizedValues[localeCode]!['off']!;

  String get whenPaid => _localizedValues[localeCode]!['when_paid']!;

  String get createClient => _localizedValues[localeCode]!['create_client']!;

  String get createInvoice => _localizedValues[localeCode]!['create_invoice']!;

  String get createQuote => _localizedValues[localeCode]!['create_quote']!;

  String get createPayment => _localizedValues[localeCode]!['create_payment']!;

  String get createVendor => _localizedValues[localeCode]!['create_vendor']!;

  String get updateQuote => _localizedValues[localeCode]!['update_quote']!;

  String get deleteQuote => _localizedValues[localeCode]!['delete_quote']!;

  String get updateInvoice => _localizedValues[localeCode]!['update_invoice']!;

  String get deleteInvoice => _localizedValues[localeCode]!['delete_invoice']!;

  String get updateClient => _localizedValues[localeCode]!['update_client']!;

  String get deleteClient => _localizedValues[localeCode]!['delete_client']!;

  String get deletePayment => _localizedValues[localeCode]!['delete_payment']!;

  String get updateVendor => _localizedValues[localeCode]!['update_vendor']!;

  String get deleteVendor => _localizedValues[localeCode]!['delete_vendor']!;

  String get createExpense => _localizedValues[localeCode]!['create_expense']!;

  String get updateExpense => _localizedValues[localeCode]!['update_expense']!;

  String get deleteExpense => _localizedValues[localeCode]!['delete_expense']!;

  String get createTask => _localizedValues[localeCode]!['create_task']!;

  String get updateTask => _localizedValues[localeCode]!['update_task']!;

  String get deleteTask => _localizedValues[localeCode]!['delete_task']!;

  String get approveQuote => _localizedValues[localeCode]!['approve_quote']!;

  String get upcomingInvoices =>
      _localizedValues[localeCode]!['upcoming_invoices']!;

  String get pastDueInvoices =>
      _localizedValues[localeCode]!['past_due_invoices']!;

  String get recentPayments =>
      _localizedValues[localeCode]!['recent_payments']!;

  String get upcomingQuotes =>
      _localizedValues[localeCode]!['upcoming_quotes']!;

  String get expiredQuotes => _localizedValues[localeCode]!['expired_quotes']!;

  String get selectedInvoices =>
      _localizedValues[localeCode]!['selected_invoices']!;

  String get selectedPayments =>
      _localizedValues[localeCode]!['selected_payments']!;

  String get selectedQuotes =>
      _localizedValues[localeCode]!['selected_quotes']!;

  String get selectedTasks => _localizedValues[localeCode]!['selected_tasks']!;

  String get selectedExpenses =>
      _localizedValues[localeCode]!['selected_expenses']!;

  String get clientSettings =>
      _localizedValues[localeCode]!['client_settings']!;

  String get netAmount => _localizedValues[localeCode]!['net_amount']!;

  String get netBalance => _localizedValues[localeCode]!['net_balance']!;

  String get gross => _localizedValues[localeCode]!['gross']!;

  String get completed => _localizedValues[localeCode]!['completed']!;

  String get onlinePaymentEmail =>
      _localizedValues[localeCode]!['online_payment_email']!;

  String get manualPaymentEmail =>
      _localizedValues[localeCode]!['manual_payment_email']!;

  String get clientCreated => _localizedValues[localeCode]!['client_created']!;

  String get storefront => _localizedValues[localeCode]!['storefront']!;

  String get storefrontHelp =>
      _localizedValues[localeCode]!['storefront_help']!;

  String get companyKey => _localizedValues[localeCode]!['company_key']!;

  String get lastLoginAt => _localizedValues[localeCode]!['last_login_at']!;

  String get paymenTypeId => _localizedValues[localeCode]!['payment_type_id']!;

  String get healthCheck => _localizedValues[localeCode]!['health_check']!;

  String get to => _localizedValues[localeCode]!['to']!;

  String get recordType => _localizedValues[localeCode]!['record_type']!;

  String get recordName => _localizedValues[localeCode]!['record_name']!;

  String get fileType => _localizedValues[localeCode]!['file_type']!;

  String get height => _localizedValues[localeCode]!['height']!;

  String get width => _localizedValues[localeCode]!['width']!;

  String get customLabels => _localizedValues[localeCode]!['custom_labels']!;

  String get selectLabel => _localizedValues[localeCode]!['select_label']!;

  String get unapplied => _localizedValues[localeCode]!['unapplied']!;

  String get apply => _localizedValues[localeCode]!['apply']!;

  String get applyPayment => _localizedValues[localeCode]!['apply_payment']!;

  String get surcharge => _localizedValues[localeCode]!['surcharge']!;

  String get hours => _localizedValues[localeCode]!['hours']!;

  String get statement => _localizedValues[localeCode]!['statement']!;

  String get taxes => _localizedValues[localeCode]!['taxes']!;

  String get rowsPerPage => _localizedValues[localeCode]!['rows_per_page']!;

  String get viewInStripe => _localizedValues[localeCode]!['view_in_stripe']!;

  String get gateway => _localizedValues[localeCode]!['gateway']!;

  String get emailedInvoices =>
      _localizedValues[localeCode]!['emailed_invoices']!;

  String get emailedQuotes => _localizedValues[localeCode]!['emailed_quotes']!;

  String get emailedCredits =>
      _localizedValues[localeCode]!['emailed_credits']!;

  String get pdfPageInfo => _localizedValues[localeCode]!['pdf_page_info']!;

  String get reminder1Sent => _localizedValues[localeCode]!['reminder1_sent']!;

  String get reminder2Sent => _localizedValues[localeCode]!['reminder2_sent']!;

  String get reminder3Sent => _localizedValues[localeCode]!['reminder3_sent']!;

  String get reminderLastSent =>
      _localizedValues[localeCode]!['reminder_last_sent']!;

  String get companyName => _localizedValues[localeCode]!['company_name']!;

  String get clientNumber => _localizedValues[localeCode]!['client_number']!;

  String get autoConvert => _localizedValues[localeCode]!['auto_convert']!;

  String get label => _localizedValues[localeCode]!['label']!;

  String get always => _localizedValues[localeCode]!['always']!;

  String get optIn => _localizedValues[localeCode]!['optin']!;

  String get optOut => _localizedValues[localeCode]!['optout']!;

  String get welcomeToInvoiceNinja =>
      _localizedValues[localeCode]!['welcome_to_invoice_ninja']!;

  String get tokenBilling => _localizedValues[localeCode]!['token_billing']!;

  String get copyLink => _localizedValues[localeCode]!['copy_link']!;

  String get viewPortal => _localizedValues[localeCode]!['view_portal']!;

  String get systemLogs => _localizedValues[localeCode]!['system_logs']!;

  String get paymentReconciliationSuccess =>
      _localizedValues[localeCode]!['payment_reconciliation_success']!;

  String get paymentReconciliationFailure =>
      _localizedValues[localeCode]!['payment_reconciliation_failure']!;

  String get gatewaySuccess =>
      _localizedValues[localeCode]!['gateway_success']!;

  String get gatewayFailure =>
      _localizedValues[localeCode]!['gateway_failure']!;

  String get gatewayError => _localizedValues[localeCode]!['gateway_error']!;

  String get emailSend => _localizedValues[localeCode]!['email_send']!;

  String get emailRetryQueue =>
      _localizedValues[localeCode]!['email_retry_queue']!;

  String get failure => _localizedValues[localeCode]!['failure']!;

  String get quotaExceeded => _localizedValues[localeCode]!['quota_exceeded']!;

  String get upstreamFailure =>
      _localizedValues[localeCode]!['upstream_failure']!;

  String get opened => _localizedValues[localeCode]!['opened']!;

  String get testMode => _localizedValues[localeCode]!['test_mode']!;

  String get allowOverPayment =>
      _localizedValues[localeCode]!['allow_over_payment']!;

  String get allowOverPaymentHelp =>
      _localizedValues[localeCode]!['allow_over_payment_help']!;

  String get allowUnderPayment =>
      _localizedValues[localeCode]!['allow_under_payment']!;

  String get allowUnderPaymentHelp =>
      _localizedValues[localeCode]!['allow_under_payment_help']!;

  String get lineItem => _localizedValues[localeCode]!['line_item']!;

  String get profit => _localizedValues[localeCode]!['profit']!;

  String get sendDate => _localizedValues[localeCode]!['send_date']!;

  String get minimumUnderPaymentAmount =>
      _localizedValues[localeCode]!['minimum_under_payment_amount']!;

  String get autoBillOn => _localizedValues[localeCode]!['auto_bill_on']!;

  String get nextSendDate => _localizedValues[localeCode]!['next_send_date']!;

  String get remainingCycles =>
      _localizedValues[localeCode]!['remaining_cycles']!;

  String get endless => _localizedValues[localeCode]!['endless']!;

  String get usePaymentTerms =>
      _localizedValues[localeCode]!['use_payment_terms']!;

  String get firstDayOfTheMonth =>
      _localizedValues[localeCode]!['first_day_of_the_month']!;

  String get lastDayOfTheMonth =>
      _localizedValues[localeCode]!['last_day_of_the_month']!;

  String get dayCount => _localizedValues[localeCode]!['day_count']!;

  String get markActive => _localizedValues[localeCode]!['mark_active']!;

  String get paused => _localizedValues[localeCode]!['paused']!;

  String get dueDateDays => _localizedValues[localeCode]!['due_date_days']!;

  String get gatewayRefund => _localizedValues[localeCode]!['gateway_refund']!;

  String get gatewayRefundHelp =>
      _localizedValues[localeCode]!['gateway_refund_help']!;

  String get totalFields => _localizedValues[localeCode]!['total_fields']!;

  String get totalTaxes => _localizedValues[localeCode]!['total_taxes']!;

  String get lineTaxes => _localizedValues[localeCode]!['line_taxes']!;

  String get captureCard => _localizedValues[localeCode]!['capture_card']!;

  String get autoBillEnabled =>
      _localizedValues[localeCode]!['auto_bill_enabled']!;

  String get copyError => _localizedValues[localeCode]!['copy_error']!;

  String get showPassword => _localizedValues[localeCode]!['show_password']!;

  String get hidePassword => _localizedValues[localeCode]!['hide_password']!;

  String get variables => _localizedValues[localeCode]!['variables']!;

  String get userField => _localizedValues[localeCode]!['user_field']!;

  String get paypal => _localizedValues[localeCode]!['paypal']!;

  String get alipay => _localizedValues[localeCode]!['alipay']!;

  String get sofort => _localizedValues[localeCode]!['sofort']!;

  String get applePay => _localizedValues[localeCode]!['apple_pay']!;

  String get crypto => _localizedValues[localeCode]!['crypto']!;

  String get markPaidHelp => _localizedValues[localeCode]!['mark_paid_help']!;

  String get addDocumentsToInvoiceHelp =>
      _localizedValues[localeCode]!['add_documents_to_invoice_help']!;

  String get expenseSettings =>
      _localizedValues[localeCode]!['expense_settings']!;

  String get convertCurrencyHelp =>
      _localizedValues[localeCode]!['convert_currency_help']!;

  String get cloneToRecurring =>
      _localizedValues[localeCode]!['clone_to_recurring']!;

  String get forceUpdate => _localizedValues[localeCode]!['force_update']!;

  String get forceUpdateHelp =>
      _localizedValues[localeCode]!['force_update_help']!;

  String get negativePaymentError =>
      _localizedValues[localeCode]!['negative_payment_error']!;

  String get viewChanges => _localizedValues[localeCode]!['view_changes']!;

  String get showOption => _localizedValues[localeCode]!['show_option']!;

  String get useAvailableCredits =>
      _localizedValues[localeCode]!['use_available_credits']!;

  String get shouldBeInvoiced =>
      _localizedValues[localeCode]!['should_be_invoiced']!;

  String get shouldBeInvoicedHelp =>
      _localizedValues[localeCode]!['should_be_invoiced_help']!;

  String get isRunning => _localizedValues[localeCode]!['is_running']!;

  String get timeLog => _localizedValues[localeCode]!['time_log']!;

  String get bankId => _localizedValues[localeCode]!['bank_id']!;

  String get expenseCategoryId =>
      _localizedValues[localeCode]!['expense_category_id']!;

  String get invoiceCurrencyId =>
      _localizedValues[localeCode]!['invoice_currency_id']!;

  String get taxName1 => _localizedValues[localeCode]!['tax_name1']!;

  String get taxName2 => _localizedValues[localeCode]!['tax_name2']!;

  String get taxName3 => _localizedValues[localeCode]!['tax_name3']!;

  String get transactionId => _localizedValues[localeCode]!['transaction_id']!;

  String get configureCategories =>
      _localizedValues[localeCode]!['configure_categories']!;

  String get configureStatuses =>
      _localizedValues[localeCode]!['configure_statuses']!;

  String get taskSettings => _localizedValues[localeCode]!['task_settings']!;

  String get invoiceTaskTimelog =>
      _localizedValues[localeCode]!['invoice_task_timelog']!;

  String get invoiceTaskTimelogHelp =>
      _localizedValues[localeCode]!['invoice_task_timelog_help']!;

  String get invoiceTaskDatelog =>
      _localizedValues[localeCode]!['invoice_task_datelog']!;

  String get invoiceTaskDatelogHelp =>
      _localizedValues[localeCode]!['invoice_task_datelog_help']!;

  String get showTasksTable =>
      _localizedValues[localeCode]!['show_tasks_table']!;

  String get showTasksTableHelp =>
      _localizedValues[localeCode]!['show_tasks_table_help']!;

  String get sortOrder => _localizedValues[localeCode]!['sort_order']!;

  String get clearCache => _localizedValues[localeCode]!['clear_cache']!;

  String get calculatedRate =>
      _localizedValues[localeCode]!['calculated_rate']!;

  String get requiredFields =>
      _localizedValues[localeCode]!['required_fields']!;

  String get clientName => _localizedValues[localeCode]!['client_name']!;

  String get clientPhone => _localizedValues[localeCode]!['client_phone']!;

  String get cvv => _localizedValues[localeCode]!['cvv']!;

  String get lateInvoice => _localizedValues[localeCode]!['late_invoice']!;

  String get expiredQuote => _localizedValues[localeCode]!['expired_quote']!;

  String get remindInvoice => _localizedValues[localeCode]!['remind_invoice']!;

  String get companyDisabledWarning =>
      _localizedValues[localeCode]!['company_disabled_warning']!;

  String get viewSettings => _localizedValues[localeCode]!['view_settings']!;

  String get warning => _localizedValues[localeCode]!['warning']!;

  String get projectNumber => _localizedValues[localeCode]!['project_number']!;

  String get projectName => _localizedValues[localeCode]!['project_name']!;

  String get taskNumber => _localizedValues[localeCode]!['task_number']!;

  String get expenseNumber => _localizedValues[localeCode]!['expense_number']!;

  String get actions => _localizedValues[localeCode]!['actions']!;

  String get invoiceTotal => _localizedValues[localeCode]!['invoice_total']!;

  String get quoteTotal => _localizedValues[localeCode]!['quote_total']!;

  String get creditTotal => _localizedValues[localeCode]!['credit_total']!;

  String get recurringInvoiceTotal =>
      _localizedValues[localeCode]!['recurring_invoice_total']!;

  String get partialDue => _localizedValues[localeCode]!['partial_due']!;

  String get invoiceLate => _localizedValues[localeCode]!['invoice_late']!;

  String get quoteExpired => _localizedValues[localeCode]!['quote_expired']!;

  String get appPlatforms => _localizedValues[localeCode]!['app_platforms']!;

  String get sourceCode => _localizedValues[localeCode]!['source_code']!;

  String get paidInvoicesArelocked =>
      _localizedValues[localeCode]!['paid_invoices_are_locked']!;

  String get sentInvoicesArelocked =>
      _localizedValues[localeCode]!['sent_invoices_are_locked']!;

  String get deliveryNote => _localizedValues[localeCode]!['delivery_note']!;

  String get whiteLabel => _localizedValues[localeCode]!['white_label']!;

  String get unpaid => _localizedValues[localeCode]!['unpaid']!;

  String get paymentTax => _localizedValues[localeCode]!['payment_tax']!;

  String get addCustom => _localizedValues[localeCode]!['add_custom']!;

  String get labels => _localizedValues[localeCode]!['labels']!;

  String get cloneToOther => _localizedValues[localeCode]!['clone_to_other']!;

  String get cloneTo => _localizedValues[localeCode]!['clone_to']!;

  String get service => _localizedValues[localeCode]!['service']!;

  String get purge => _localizedValues[localeCode]!['purge']!;

  String get pleaseTypeToConfirm =>
      _localizedValues[localeCode]!['please_type_to_confirm']!;

  String get fullscreenEditor =>
      _localizedValues[localeCode]!['fullscreen_editor']!;

  String get sidebarEditor => _localizedValues[localeCode]!['sidebar_editor']!;

  String get webhookUrl => _localizedValues[localeCode]!['webhook_url']!;

  String get viewLicenses => _localizedValues[localeCode]!['view_licenses']!;

  String get csvFile => _localizedValues[localeCode]!['csv_file']!;

  String get noFileSelected =>
      _localizedValues[localeCode]!['no_file_selected']!;

  String get firstRowAsColumnNames =>
      _localizedValues[localeCode]!['first_row_as_column_names']!;

  String get column => _localizedValues[localeCode]!['column']!;

  String get sample => _localizedValues[localeCode]!['sample']!;

  String get mapTo => _localizedValues[localeCode]!['map_to']!;

  String get usesInclusiveTaxes =>
      _localizedValues[localeCode]!['uses_inclusive_taxes']!;

  String get isAmountDiscount =>
      _localizedValues[localeCode]!['is_amount_discount']!;

  String get duplicateColumnMapping =>
      _localizedValues[localeCode]!['duplicate_column_mapping']!;

  String get startedImport => _localizedValues[localeCode]!['started_import']!;

  String get updateApp => _localizedValues[localeCode]!['update_app']!;

  String get runningTasks => _localizedValues[localeCode]!['running_tasks']!;

  String get recentTasks => _localizedValues[localeCode]!['recent_tasks']!;

  String get recentExpenses =>
      _localizedValues[localeCode]!['recent_expenses']!;

  String get upcomingExpenses =>
      _localizedValues[localeCode]!['upcoming_expenses']!;

  String get debugModeIsEnabled =>
      _localizedValues[localeCode]!['debug_mode_is_enabled']!;

  String get debugModeIsEnabledHelp =>
      _localizedValues[localeCode]!['debug_mode_is_enabled_help']!;

  String get emptyColumns => _localizedValues[localeCode]!['empty_columns']!;

  String get show => _localizedValues[localeCode]!['show']!;

  String get hide => _localizedValues[localeCode]!['hide']!;

  String get color => _localizedValues[localeCode]!['color']!;

  String get enterTaxes => _localizedValues[localeCode]!['enter_taxes']!;

  String get byRate => _localizedValues[localeCode]!['by_rate']!;

  String get byAmount => _localizedValues[localeCode]!['by_amount']!;

  String get enterAmount => _localizedValues[localeCode]!['enter_amount']!;

  String get beforeTaxes => _localizedValues[localeCode]!['before_taxes']!;

  String get afterTaxes => _localizedValues[localeCode]!['after_taxes']!;

  String get isSent => _localizedValues[localeCode]!['is_sent']!;

  String get defaultDocuments =>
      _localizedValues[localeCode]!['default_documents']!;

  String get convertedAmount =>
      _localizedValues[localeCode]!['converted_amount']!;

  String get convertedBalance =>
      _localizedValues[localeCode]!['converted_balance']!;

  String get supportedEvents =>
      _localizedValues[localeCode]!['supported_events']!;

  String get saveAndPreview =>
      _localizedValues[localeCode]!['save_and_preview']!;

  String get saveAndEmail => _localizedValues[localeCode]!['save_and_email']!;

  String get searchPaymentTerm =>
      _localizedValues[localeCode]!['search_payment_term']!;

  String get searchPaymentTerms =>
      _localizedValues[localeCode]!['search_payment_terms']!;

  String get invoiceTask => _localizedValues[localeCode]!['invoice_task']!;

  String get invoiceProject =>
      _localizedValues[localeCode]!['invoice_project']!;

  String get invoiceExpense =>
      _localizedValues[localeCode]!['invoice_expense']!;

  String get registrationUrl =>
      _localizedValues[localeCode]!['registration_url']!;

  String get convertToInvoice =>
      _localizedValues[localeCode]!['convert_to_invoice']!;

  String get toUpdateRun => _localizedValues[localeCode]!['to_update_run']!;

  String get thisQuarter => _localizedValues[localeCode]!['this_quarter']!;

  String get lastQuarter => _localizedValues[localeCode]!['last_quarter']!;

  String get counterPatternError =>
      _localizedValues[localeCode]!['counter_pattern_error']!;

  String get convertedPaidToDate =>
      _localizedValues[localeCode]!['converted_paid_to_date']!;

  String get convertedCreditBalance =>
      _localizedValues[localeCode]!['converted_credit_balance']!;

  String get convertedTotal =>
      _localizedValues[localeCode]!['converted_total']!;

  String get emailSentToConfirmEmail =>
      _localizedValues[localeCode]!['email_sent_to_confirm_email']!;

  String get listLongPress => _localizedValues[localeCode]!['list_long_press']!;

  String get showActions => _localizedValues[localeCode]!['show_actions']!;

  String get startMultiselect =>
      _localizedValues[localeCode]!['start_multiselect']!;

  String get selectAGmailUser =>
      _localizedValues[localeCode]!['select_a_gmail_user']!;

  String get partiallyUnapplied =>
      _localizedValues[localeCode]!['partially_unapplied']!;

  String get refundedPayment =>
      _localizedValues[localeCode]!['refunded_payment']!;

  String get confirmYourEmailAddress =>
      _localizedValues[localeCode]!['confirm_your_email_address']!;

  String get resendEmail => _localizedValues[localeCode]!['resend_email']!;

  String get securitySettings =>
      _localizedValues[localeCode]!['security_settings']!;

  String get webSessionTimeout =>
      _localizedValues[localeCode]!['web_session_timeout']!;

  String get countHours => _localizedValues[localeCode]!['count_hours']!;

  String get countDays => _localizedValues[localeCode]!['count_days']!;

  String get countDay => _localizedValues[localeCode]!['count_day']!;

  String get sessionAboutToExpire =>
      _localizedValues[localeCode]!['session_about_to_expire']!;

  String get stayLoggedIn => _localizedValues[localeCode]!['stay_logged_in']!;

  String get requirePasswordWithSocialLogin =>
      _localizedValues[localeCode]!['require_password_with_social_login']!;

  String get enableTwoFactor =>
      _localizedValues[localeCode]!['enable_two_factor']!;

  String get disableTwoFactor =>
      _localizedValues[localeCode]!['disable_two_factor']!;

  String get disabledTwoFactor =>
      _localizedValues[localeCode]!['disabled_two_factor']!;

  String get connectGoogle => _localizedValues[localeCode]!['connect_google']!;

  String get disconnectGoogle =>
      _localizedValues[localeCode]!['disconnect_google']!;

  String get twoFactorSetupHelp =>
      _localizedValues[localeCode]!['two_factor_setup_help']!;

  String get enabledTwoFactor =>
      _localizedValues[localeCode]!['enabled_two_factor']!;

  String get smsCode => _localizedValues[localeCode]!['sms_code']!;

  String get sendSms => _localizedValues[localeCode]!['send_sms']!;

  String get enterPhoneToEnableTwoFactor =>
      _localizedValues[localeCode]!['enter_phone_to_enable_two_factor']!;

  String get viewDocs => _localizedValues[localeCode]!['view_docs']!;

  String get delivered => _localizedValues[localeCode]!['delivered']!;

  String get bounced => _localizedValues[localeCode]!['bounced']!;

  String get spam => _localizedValues[localeCode]!['spam']!;

  String get connectedGoogle =>
      _localizedValues[localeCode]!['connected_google']!;

  String get disconnectedGoogle =>
      _localizedValues[localeCode]!['disconnected_google']!;

  String get resendInvite => _localizedValues[localeCode]!['resend_invite']!;

  String get pleaseSelectACountry =>
      _localizedValues[localeCode]!['please_select_a_country']!;

  String get helpTranslate => _localizedValues[localeCode]!['help_translate']!;

  String get changingPhoneDisablesTwoFactor =>
      _localizedValues[localeCode]!['changing_phone_disables_two_factor']!;

  String get pleaseFirstSetAPassword =>
      _localizedValues[localeCode]!['please_first_set_a_password']!;

  String get anErrorOccurredTryAgain =>
      _localizedValues[localeCode]!['an_error_occurred_try_again']!;

  String get activateCompany =>
      _localizedValues[localeCode]!['activate_company']!;

  String get activateCompanyHelp =>
      _localizedValues[localeCode]!['activate_company_help']!;

  String get useLastEmail => _localizedValues[localeCode]!['use_last_email']!;

  String get sharedInvoiceCreditCounter =>
      _localizedValues[localeCode]!['shared_invoice_credit_counter']!;

  String get passwordTimeout =>
      _localizedValues[localeCode]!['password_timeout']!;

  String get countMinutes => _localizedValues[localeCode]!['count_minutes']!;

  String get clientIdNumber =>
      _localizedValues[localeCode]!['client_id_number']!;

  String get updateFailHelp =>
      _localizedValues[localeCode]!['update_fail_help']!;

  String get connectGmail => _localizedValues[localeCode]!['connect_gmail']!;

  String get disconnectGmail =>
      _localizedValues[localeCode]!['disconnect_gmail']!;

  String get connectedGmail =>
      _localizedValues[localeCode]!['connected_gmail']!;

  String get disconnectedGmail =>
      _localizedValues[localeCode]!['disconnected_gmail']!;

  String get subdomainIsNotAvailable =>
      _localizedValues[localeCode]!['subdomain_is_not_available']!;

  String get paymentLink =>
      _localizedValues[localeCode]!['payment_link'] ??
      _localizedValues['en']!['payment_link']!;

  String get paymentLinks =>
      _localizedValues[localeCode]!['payment_links'] ??
      _localizedValues['en']!['payment_links']!;

  String get newPaymentLink =>
      _localizedValues[localeCode]!['new_payment_link'] ??
      _localizedValues['en']!['new_payment_link']!;

  String get createdPaymentLink =>
      _localizedValues[localeCode]!['created_payment_link'] ??
      _localizedValues['en']!['created_payment_link']!;

  String get updatedPaymentLink =>
      _localizedValues[localeCode]!['updated_payment_link'] ??
      _localizedValues['en']!['updated_payment_link']!;

  String get archivedPaymentLink =>
      _localizedValues[localeCode]!['archived_payment_link'] ??
      _localizedValues['en']!['archived_payment_link']!;

  String get deletedPaymentLink =>
      _localizedValues[localeCode]!['deleted_payment_link'] ??
      _localizedValues['en']!['deleted_payment_link']!;

  String get restoredPaymentLink =>
      _localizedValues[localeCode]!['restored_payment_link'] ??
      _localizedValues['en']!['restored_payment_link']!;

  String get editPaymentLink =>
      _localizedValues[localeCode]!['edit_payment_link'] ??
      _localizedValues['en']!['edit_payment_link']!;

  String get searchPaymentLink =>
      _localizedValues[localeCode]!['search_payment_link'] ??
      _localizedValues['en']!['search_payment_link']!;

  String get searchPaymentLinks =>
      _localizedValues[localeCode]!['search_payment_links'] ??
      _localizedValues['en']!['search_payment_links']!;

  String get security => _localizedValues[localeCode]!['security']!;

  String get emailBounced => _localizedValues[localeCode]!['email_bounced']!;

  String get emailSpamComplaint =>
      _localizedValues[localeCode]!['email_spam_complaint']!;

  String get emailDelivery => _localizedValues[localeCode]!['email_delivery']!;

  String get webhookResponse =>
      _localizedValues[localeCode]!['webhook_response']!;

  String get pdfResponse => _localizedValues[localeCode]!['pdf_response']!;

  String get authenticationFailure =>
      _localizedValues[localeCode]!['authentication_failure']!;

  String get pdfFailed => _localizedValues[localeCode]!['pdf_failed']!;

  String get pdfSuccess => _localizedValues[localeCode]!['pdf_success']!;

  String get modified => _localizedValues[localeCode]!['modified']!;

  String get recurringProducts =>
      _localizedValues[localeCode]!['recurring_products']!;

  String get promoCode => _localizedValues[localeCode]!['promo_code']!;

  String get promoDiscount => _localizedValues[localeCode]!['promo_discount']!;

  String get allowCancellation =>
      _localizedValues[localeCode]!['allow_cancellation']!;

  String get perSeatEnabled =>
      _localizedValues[localeCode]!['per_seat_enabled']!;

  String get maxSeatsLimit => _localizedValues[localeCode]!['max_seats_limit']!;

  String get trialEnabled => _localizedValues[localeCode]!['trial_enabled']!;

  String get trialDuration => _localizedValues[localeCode]!['trial_duration']!;

  String get allowQueryOverrides =>
      _localizedValues[localeCode]!['allow_query_overrides']!;

  String get allowPlanChanges =>
      _localizedValues[localeCode]!['allow_plan_changes']!;

  String get planMap => _localizedValues[localeCode]!['plan_map']!;

  String get refundPeriod => _localizedValues[localeCode]!['refund_period']!;

  String get webhookConfiguration =>
      _localizedValues[localeCode]!['webhook_configuration']!;

  String get purchasePage => _localizedValues[localeCode]!['purchase_page']!;

  String get returnUrl => _localizedValues[localeCode]!['return_url']!;

  String get restMethod => _localizedValues[localeCode]!['rest_method']!;

  String get headerKey => _localizedValues[localeCode]!['header_key']!;

  String get invoicePaymentTerms =>
      _localizedValues[localeCode]!['invoice_payment_terms']!;

  String get quoteValidUntil =>
      _localizedValues[localeCode]!['quote_valid_until']!;

  String get headerValue => _localizedValues[localeCode]!['header_value']!;

  String get addHeader => _localizedValues[localeCode]!['add_header']!;

  String get removeHeader => _localizedValues[localeCode]!['remove_header']!;

  String get noHeaders => _localizedValues[localeCode]!['no_headers']!;

  String get upgradeToPaidPlan =>
      _localizedValues[localeCode]!['upgrade_to_paid_plan']!;

  String get ownerUpgradeToPaidPlan =>
      _localizedValues[localeCode]!['owner_upgrade_to_paid_plan']!;

  String get pageLayout => _localizedValues[localeCode]!['page_layout']!;

  String get portrait => _localizedValues[localeCode]!['portrait']!;

  String get landscape => _localizedValues[localeCode]!['landscape']!;

  String get letter => _localizedValues[localeCode]!['letter']!;

  String get legal => _localizedValues[localeCode]!['legal']!;

  String get isViewed => _localizedValues[localeCode]!['is_viewed']!;

  String get viewDateFormats =>
      _localizedValues[localeCode]!['view_date_formats']!;

  String get addBodyVariableMessage =>
      _localizedValues[localeCode]!['add_body_variable_message']!;

  String get bodyVariableMissing =>
      _localizedValues[localeCode]!['body_variable_missing']!;

  String get subdomainHelp => _localizedValues[localeCode]!['subdomain_help']!;

  String get moveTop => _localizedValues[localeCode]!['move_top']!;

  String get moveUp => _localizedValues[localeCode]!['move_up']!;

  String get moveDown => _localizedValues[localeCode]!['move_down']!;

  String get moveBottom => _localizedValues[localeCode]!['move_bottom']!;

  String get enable => _localizedValues[localeCode]!['enable']!;

  String get kanban =>
      _localizedValues[localeCode]!['kanban'] ??
      _localizedValues['en']!['kanban']!;

  String get searchKanban =>
      _localizedValues[localeCode]!['search_kanban'] ??
      _localizedValues['en']!['search_kanban']!;

  String get searchKanbans =>
      _localizedValues[localeCode]!['search_kanbans'] ??
      _localizedValues['en']!['search_kanbans']!;

  String get partialValue =>
      _localizedValues[localeCode]!['partial_value'] ??
      _localizedValues['en']!['partial_value']!;

  String get unassigned =>
      _localizedValues[localeCode]!['unassigned'] ??
      _localizedValues['en']!['unassigned']!;

  String get order =>
      _localizedValues[localeCode]!['order'] ??
      _localizedValues['en']!['order']!;

  String get contactFirstName =>
      _localizedValues[localeCode]!['contact_first_name'] ??
      _localizedValues['en']!['contact_first_name']!;

  String get contactLastName =>
      _localizedValues[localeCode]!['contact_last_name'] ??
      _localizedValues['en']!['contact_last_name']!;

  String get invoiceItem =>
      _localizedValues[localeCode]!['invoice_item'] ??
      _localizedValues['en']!['invoice_item']!;

  String get quoteItem =>
      _localizedValues[localeCode]!['quote_item'] ??
      _localizedValues['en']!['quote_item']!;

  String get lastUpdated =>
      _localizedValues[localeCode]!['last_updated'] ??
      _localizedValues['en']!['last_updated']!;

  String get pro =>
      _localizedValues[localeCode]!['pro'] ?? _localizedValues['en']!['pro']!;

  String get enterprise =>
      _localizedValues[localeCode]!['enterprise'] ??
      _localizedValues['en']!['enterprise']!;

  String get invoiceCreated =>
      _localizedValues[localeCode]!['invoice_created'] ??
      _localizedValues['en']!['invoice_created']!;

  String get quoteCreated =>
      _localizedValues[localeCode]!['quote_created'] ??
      _localizedValues['en']!['quote_created']!;

  String get creditCreated =>
      _localizedValues[localeCode]!['credit_created'] ??
      _localizedValues['en']!['credit_created']!;

  String get endAllSessions =>
      _localizedValues[localeCode]!['end_all_sessions'] ??
      _localizedValues['en']!['end_all_sessions']!;

  String get countSession =>
      _localizedValues[localeCode]!['count_session'] ??
      _localizedValues['en']!['count_session']!;

  String get countSessions =>
      _localizedValues[localeCode]!['count_sessions'] ??
      _localizedValues['en']!['count_sessions']!;

  String get endedAllSessions =>
      _localizedValues[localeCode]!['ended_all_sessions'] ??
      _localizedValues['en']!['ended_all_sessions']!;

  String get yearsDataShown =>
      _localizedValues[localeCode]!['years_data_shown'] ??
      _localizedValues['en']!['years_data_shown']!;

  String get gatewaySetup =>
      _localizedValues[localeCode]!['gateway_setup'] ??
      _localizedValues['en']!['gateway_setup']!;

  String get showTaskEndDate =>
      _localizedValues[localeCode]!['show_task_end_date'] ??
      _localizedValues['en']!['show_task_end_date']!;

  String get showTaskEndDateHelp =>
      _localizedValues[localeCode]!['show_task_end_date_help'] ??
      _localizedValues['en']!['show_task_end_date_help']!;

  String get migrationNotYetCompleted =>
      _localizedValues[localeCode]!['migration_not_yet_completed'] ??
      _localizedValues['en']!['migration_not_yet_completed']!;

  String get accountId =>
      _localizedValues[localeCode]!['account_id'] ??
      _localizedValues['en']!['account_id']!;

  String get step1SignIn =>
      _localizedValues[localeCode]!['step_1_sign_in'] ??
      _localizedValues['en']!['step_1_sign_in']!;

  String get step2Authorize =>
      _localizedValues[localeCode]!['step_2_authorize'] ??
      _localizedValues['en']!['step_2_authorize']!;

  String get includeDeletedClients =>
      _localizedValues[localeCode]!['include_deleted_clients'] ??
      _localizedValues['en']!['include_deleted_clients']!;

  String get includeDeletedClientsHelp =>
      _localizedValues[localeCode]!['include_deleted_clients_help'] ??
      _localizedValues['en']!['include_deleted_clients_help']!;

  String get exportedData =>
      _localizedValues[localeCode]!['exported_data'] ??
      _localizedValues['en']!['exported_data']!;

  String get loginSuccess =>
      _localizedValues[localeCode]!['login_success'] ??
      _localizedValues['en']!['login_success']!;

  String get loginFailure =>
      _localizedValues[localeCode]!['login_failure'] ??
      _localizedValues['en']!['login_failure']!;

  String get importCustomers =>
      _localizedValues[localeCode]!['import_customers'] ??
      _localizedValues['en']!['import_customers']!;

  String get importedCustomers =>
      _localizedValues[localeCode]!['imported_customers'] ??
      _localizedValues['en']!['imported_customers']!;

  String get hasTaxes =>
      _localizedValues[localeCode]!['has_taxes'] ??
      _localizedValues['en']!['has_taxes']!;

  String get netTotal =>
      _localizedValues[localeCode]!['net_total'] ??
      _localizedValues['en']!['net_total']!;

  String get draftMode =>
      _localizedValues[localeCode]!['html_mode'] ??
      _localizedValues['en']!['html_mode']!;

  String get draftModeHelp =>
      _localizedValues[localeCode]!['html_mode_help'] ??
      _localizedValues['en']!['html_mode_help']!;

  String get waitForData =>
      _localizedValues[localeCode]!['wait_for_data'] ??
      _localizedValues['en']!['wait_for_data']!;

  String get noPaymentTypesEnabled =>
      _localizedValues[localeCode]!['no_payment_types_enabled'] ??
      _localizedValues['en']!['no_payment_types_enabled']!;

  String get json =>
      _localizedValues[localeCode]!['json'] ?? _localizedValues['en']!['json']!;

  String get jsonFileMissing =>
      _localizedValues[localeCode]!['json_file_missing'] ??
      _localizedValues['en']!['json_file_missing']!;

  String get jsonOptionMissing =>
      _localizedValues[localeCode]!['json_option_missing'] ??
      _localizedValues['en']!['json_option_missing']!;

  String get importData =>
      _localizedValues[localeCode]!['import_data'] ??
      _localizedValues['en']!['import_data']!;

  String get importSettings =>
      _localizedValues[localeCode]!['import_settings'] ??
      _localizedValues['en']!['import_settings']!;

  String get sendTime =>
      _localizedValues[localeCode]!['send_time'] ??
      _localizedValues['en']!['send_time']!;

  String get subdomainGuide =>
      _localizedValues[localeCode]!['subdomain_guide'] ??
      _localizedValues['en']!['subdomain_guide']!;

  String get tasksShownInPortal =>
      _localizedValues[localeCode]!['tasks_shown_in_portal'] ??
      _localizedValues['en']!['tasks_shown_in_portal']!;

  String get uninvoiced =>
      _localizedValues[localeCode]!['uninvoiced'] ??
      _localizedValues['en']!['uninvoiced']!;

  String get clientPortalDomainHint =>
      _localizedValues[localeCode]!['client_portal_domain_hint'] ??
      _localizedValues['en']!['client_portal_domain_hint']!;

  String get changeEmail =>
      _localizedValues[localeCode]!['change_email'] ??
      _localizedValues['en']!['change_email']!;

  String get freeTrial =>
      _localizedValues[localeCode]!['free_trial'] ??
      _localizedValues['en']!['free_trial']!;

  String get freeTrialEndsInDays =>
      _localizedValues[localeCode]!['free_trial_ends_in_days'] ??
      _localizedValues['en']!['free_trial_ends_in_days']!;

  String get freeTrialEndsToday =>
      _localizedValues[localeCode]!['free_trial_ends_today'] ??
      _localizedValues['en']!['free_trial_ends_today']!;

  String get checkStatus =>
      _localizedValues[localeCode]!['check_status'] ??
      _localizedValues['en']!['check_status']!;

  String get reviewApp =>
      _localizedValues[localeCode]!['review_app'] ??
      _localizedValues['en']!['review_app']!;

  String get netSubtotal =>
      _localizedValues[localeCode]!['net_subtotal'] ??
      _localizedValues['en']!['net_subtotal']!;

  String get sidebarActiveBackgroundColor =>
      _localizedValues[localeCode]!['sidebar_active_background_color'] ??
      _localizedValues['en']!['sidebar_active_background_color']!;

  String get sidebarActiveFontColor =>
      _localizedValues[localeCode]!['sidebar_active_font_color'] ??
      _localizedValues['en']!['sidebar_active_font_color']!;

  String get sidebarInactiveBackgroundColor =>
      _localizedValues[localeCode]!['sidebar_inactive_background_color'] ??
      _localizedValues['en']!['sidebar_inactive_background_color']!;

  String get sidebarInactiveFontColor =>
      _localizedValues[localeCode]!['sidebar_inactive_font_color'] ??
      _localizedValues['en']!['sidebar_inactive_font_color']!;

  String get tableAlternateRowBackgroundColor =>
      _localizedValues[localeCode]!['table_alternate_row_background_color'] ??
      _localizedValues['en']!['table_alternate_row_background_color']!;

  String get invoiceHeaderBackgroundColor =>
      _localizedValues[localeCode]!['invoice_header_background_color'] ??
      _localizedValues['en']!['invoice_header_background_color']!;

  String get invoiceHeaderFontColor =>
      _localizedValues[localeCode]!['invoice_header_font_color'] ??
      _localizedValues['en']!['invoice_header_font_color']!;

  String get colors =>
      _localizedValues[localeCode]!['colors'] ??
      _localizedValues['en']!['colors']!;

  String get customColors =>
      _localizedValues[localeCode]!['custom_colors'] ??
      _localizedValues['en']!['custom_colors']!;

  String get statusColorTheme =>
      _localizedValues[localeCode]!['status_color_theme'] ??
      _localizedValues['en']!['status_color_theme']!;

  String get loadColorTheme =>
      _localizedValues[localeCode]!['load_color_theme'] ??
      _localizedValues['en']!['load_color_theme']!;

  String get clearAll =>
      _localizedValues[localeCode]!['clear_all'] ??
      _localizedValues['en']!['clear_all']!;

  String get contrast =>
      _localizedValues[localeCode]!['contrast'] ??
      _localizedValues['en']!['contrast']!;

  String get exportColors =>
      _localizedValues[localeCode]!['export_colors'] ??
      _localizedValues['en']!['export_colors']!;

  String get importColors =>
      _localizedValues[localeCode]!['import_colors'] ??
      _localizedValues['en']!['import_colors']!;

  String get previousPage =>
      _localizedValues[localeCode]!['previous_page'] ??
      _localizedValues['en']!['previous_page']!;

  String get nextPage =>
      _localizedValues[localeCode]!['next_page'] ??
      _localizedValues['en']!['next_page']!;

  String get addSecondContact =>
      _localizedValues[localeCode]!['add_second_contact'] ??
      _localizedValues['en']!['add_second_contact']!;

  String get userGuide =>
      _localizedValues[localeCode]!['user_guide'] ??
      _localizedValues['en']!['user_guide']!;

  String get enableMarkdown =>
      _localizedValues[localeCode]!['enable_markdown'] ??
      _localizedValues['en']!['enable_markdown']!;

  String get enableMarkdownHelp =>
      _localizedValues[localeCode]!['enable_markdown_help'] ??
      _localizedValues['en']!['enable_markdown_help']!;

  String get expenseTaxHelp =>
      _localizedValues[localeCode]!['expense_tax_help'] ??
      _localizedValues['en']!['expense_tax_help']!;

  String get useWebAppToConnectGmail =>
      _localizedValues[localeCode]!['use_web_app_to_connect_gmail'] ??
      _localizedValues['en']!['use_web_app_to_connect_gmail']!;

  String get selectMethod =>
      _localizedValues[localeCode]!['select_method'] ??
      _localizedValues['en']!['select_method']!;

  String get selectPlatform =>
      _localizedValues[localeCode]!['select_platform'] ??
      _localizedValues['en']!['select_platform']!;

  String get googleAnalyticsTrackingId =>
      _localizedValues[localeCode]!['google_analytics_tracking_id'] ??
      _localizedValues['en']!['google_analytics_tracking_id']!;

  String get googleAnalytics =>
      _localizedValues[localeCode]!['google_analytics'] ??
      _localizedValues['en']!['google_analytics']!;

  String get useCommaAsDecimalPlace =>
      _localizedValues[localeCode]!['use_comma_as_decimal_place'] ??
      _localizedValues['en']!['use_comma_as_decimal_place']!;

  String get decimalComma =>
      _localizedValues[localeCode]!['decimal_comma'] ??
      _localizedValues['en']!['decimal_comma']!;

  String get verifyCustomers =>
      _localizedValues[localeCode]!['verify_customers'] ??
      _localizedValues['en']!['verify_customers']!;

  String get customerCount =>
      _localizedValues[localeCode]!['customer_count'] ??
      _localizedValues['en']!['customer_count']!;

  String get persistData =>
      _localizedValues[localeCode]!['persist_data'] ??
      _localizedValues['en']!['persist_data']!;

  String get changePlan =>
      _localizedValues[localeCode]!['change_plan'] ??
      _localizedValues['en']!['change_plan']!;

  String get isInvoiced =>
      _localizedValues[localeCode]!['is_invoiced'] ??
      _localizedValues['en']!['is_invoiced']!;

  String get includeDrafts =>
      _localizedValues[localeCode]!['include_drafts'] ??
      _localizedValues['en']!['include_drafts']!;

  String get includeDraftsHelp =>
      _localizedValues[localeCode]!['include_drafts_help'] ??
      _localizedValues['en']!['include_drafts_help']!;

  String get lastSentDate =>
      _localizedValues[localeCode]!['last_sent_date'] ??
      _localizedValues['en']!['last_sent_date']!;

  String get recurringExpense =>
      _localizedValues[localeCode]!['recurring_expense'] ??
      _localizedValues['en']!['recurring_expense']!;

  String get newRecurringExpense =>
      _localizedValues[localeCode]!['new_recurring_expense'] ??
      _localizedValues['en']!['new_recurring_expense']!;

  String get createdRecurringExpense =>
      _localizedValues[localeCode]!['created_recurring_expense'] ??
      _localizedValues['en']!['created_recurring_expense']!;

  String get updatedRecurringExpense =>
      _localizedValues[localeCode]!['updated_recurring_expense'] ??
      _localizedValues['en']!['updated_recurring_expense']!;

  String get archivedRecurringExpense =>
      _localizedValues[localeCode]!['archived_recurring_expense'] ??
      _localizedValues['en']!['archived_recurring_expense']!;

  String get deletedRecurringExpense =>
      _localizedValues[localeCode]!['deleted_recurring_expense'] ??
      _localizedValues['en']!['deleted_recurring_expense']!;

  String get restoredRecurringExpense =>
      _localizedValues[localeCode]!['restored_recurring_expense'] ??
      _localizedValues['en']!['restored_recurring_expense']!;

  String get searchRecurringExpense =>
      _localizedValues[localeCode]!['search_recurring_expense'] ??
      _localizedValues['en']!['search_recurring_expense']!;

  String get searchRecurringExpenses =>
      _localizedValues[localeCode]!['search_recurring_expenses'] ??
      _localizedValues['en']!['search_recurring_expenses']!;

  String get cloneToExpense =>
      _localizedValues[localeCode]!['clone_to_expense'] ??
      _localizedValues['en']!['clone_to_expense']!;

  String get fromName =>
      _localizedValues[localeCode]!['from_name'] ??
      _localizedValues['en']!['from_name']!;

  String get bulkEmailInvoices =>
      _localizedValues[localeCode]!['bulk_email_invoices'] ??
      _localizedValues['en']!['bulk_email_invoices']!;

  String get bulkEmailQuotes =>
      _localizedValues[localeCode]!['bulk_email_quotes'] ??
      _localizedValues['en']!['bulk_email_quotes']!;

  String get bulkEmailCredits =>
      _localizedValues[localeCode]!['bulk_email_credits'] ??
      _localizedValues['en']!['bulk_email_credits']!;

  String get grossLineTotal =>
      _localizedValues[localeCode]!['gross_line_total'] ??
      _localizedValues['en']!['gross_line_total']!;

  String get forBestPerformance =>
      _localizedValues[localeCode]!['for_best_performance'] ??
      _localizedValues['en']!['for_best_performance']!;

  String get app =>
      _localizedValues[localeCode]!['app'] ?? _localizedValues['en']!['app']!;

  String get errorCrossClientTasks =>
      _localizedValues[localeCode]!['error_cross_client_tasks'] ??
      _localizedValues['en']!['error_cross_client_tasks']!;

  String get errorCrossClientExpenses =>
      _localizedValues[localeCode]!['error_cross_client_expenses'] ??
      _localizedValues['en']!['error_cross_client_expenses']!;

  String get webhookSuccess =>
      _localizedValues[localeCode]!['webhook_success'] ??
      _localizedValues['en']!['webhook_success']!;

  String get whyAreYouLeaving =>
      _localizedValues[localeCode]!['why_are_you_leaving'] ??
      _localizedValues['en']!['why_are_you_leaving']!;

  String get updatedCompany =>
      _localizedValues[localeCode]!['updated_company'] ??
      _localizedValues['en']!['updated_company']!;

  String get setDefaultCompany =>
      _localizedValues[localeCode]!['set_default_company'] ??
      _localizedValues['en']!['set_default_company']!;

  String get system =>
      _localizedValues[localeCode]!['system'] ??
      _localizedValues['en']!['system']!;

  String get updateAllRecords =>
      _localizedValues[localeCode]!['update_all_records'] ??
      _localizedValues['en']!['update_all_records']!;

  String get ideal =>
      _localizedValues[localeCode]!['ideal'] ??
      _localizedValues['en']!['ideal']!;

  String get sepa =>
      _localizedValues[localeCode]!['sepa'] ?? _localizedValues['en']!['sepa']!;

  String get giropay =>
      _localizedValues[localeCode]!['giropay'] ??
      _localizedValues['en']!['giropay']!;

  String get przelewy24 =>
      _localizedValues[localeCode]!['przelewy24'] ??
      _localizedValues['en']!['przelewy24']!;

  String get eps =>
      _localizedValues[localeCode]!['eps'] ?? _localizedValues['en']!['eps']!;

  String get fpx =>
      _localizedValues[localeCode]!['fpx'] ?? _localizedValues['en']!['fpx']!;

  String get bancontact =>
      _localizedValues[localeCode]!['bancontact'] ??
      _localizedValues['en']!['bancontact']!;

  String get viewStatement =>
      _localizedValues[localeCode]!['view_statement'] ??
      _localizedValues['en']!['view_statement']!;

  String get viewExpense =>
      _localizedValues[localeCode]!['view_expense'] ??
      _localizedValues['en']!['view_expense']!;

  String get unauthorizedStripeWarning =>
      _localizedValues[localeCode]!['unauthorized_stripe_warning'] ??
      _localizedValues['en']!['unauthorized_stripe_warning']!;

  String get registration =>
      _localizedValues[localeCode]!['registration'] ??
      _localizedValues['en']!['registration']!;

  String get hasTasks =>
      _localizedValues[localeCode]!['has_tasks'] ??
      _localizedValues['en']!['has_tasks']!;

  String get clientPostalCode =>
      _localizedValues[localeCode]!['client_postal_code'] ??
      _localizedValues['en']!['client_postal_code']!;

  String get clientVatNumber =>
      _localizedValues[localeCode]!['client_vat_number'] ??
      _localizedValues['en']!['client_vat_number']!;

  String get persistDataHelp =>
      _localizedValues[localeCode]!['persist_data_help'] ??
      _localizedValues['en']!['persist_data_help']!;

  String get persistUiHelp =>
      _localizedValues[localeCode]!['persist_ui_help'] ??
      _localizedValues['en']!['persist_ui_help']!;

  String get persistUi =>
      _localizedValues[localeCode]!['persist_ui'] ??
      _localizedValues['en']!['persist_ui']!;

  String get acss =>
      _localizedValues[localeCode]!['acss'] ?? _localizedValues['en']!['acss']!;

  String get becs =>
      _localizedValues[localeCode]!['becs'] ?? _localizedValues['en']!['becs']!;

  String get addToInvoices =>
      _localizedValues[localeCode]!['add_to_invoices'] ??
      _localizedValues['en']!['add_to_invoices']!;

  String get disconnect =>
      _localizedValues[localeCode]!['disconnect'] ??
      _localizedValues['en']!['disconnect']!;

  String get disconnectedGateway =>
      _localizedValues[localeCode]!['disconnected_gateway'] ??
      _localizedValues['en']!['disconnected_gateway']!;

  String get pleaseSetAPassword =>
      _localizedValues[localeCode]!['please_set_a_password'] ??
      _localizedValues['en']!['please_set_a_password']!;

  String get setPassword =>
      _localizedValues[localeCode]!['set_password'] ??
      _localizedValues['en']!['set_password']!;

  String get directDebit =>
      _localizedValues[localeCode]!['direct_debit'] ??
      _localizedValues['en']!['direct_debit']!;

  String get applyCredit =>
      _localizedValues[localeCode]!['apply_credit'] ??
      _localizedValues['en']!['apply_credit']!;

  String get creditIsMoreThanInvoice =>
      _localizedValues[localeCode]!['credit_is_more_than_invoice'] ??
      _localizedValues['en']!['credit_is_more_than_invoice']!;

  String get clickSelected =>
      _localizedValues[localeCode]!['click_selected'] ??
      _localizedValues['en']!['click_selected']!;

  String get editRecord =>
      _localizedValues[localeCode]!['edit_record'] ??
      _localizedValues['en']!['edit_record']!;

  String get hidePreview =>
      _localizedValues[localeCode]!['hide_preview'] ??
      _localizedValues['en']!['hide_preview']!;

  String get instantBankPay =>
      _localizedValues[localeCode]!['instant_bank_pay'] ??
      _localizedValues['en']!['instant_bank_pay']!;

  String get remindMe =>
      _localizedValues[localeCode]!['remind_me'] ??
      _localizedValues['en']!['remind_me']!;

  String get printPdf =>
      _localizedValues[localeCode]!['print_pdf'] ??
      _localizedValues['en']!['print_pdf']!;

  String get showPdfPreview =>
      _localizedValues[localeCode]!['show_pdf_preview'] ??
      _localizedValues['en']!['show_pdf_preview']!;

  String get showPdfPreviewHelp =>
      _localizedValues[localeCode]!['show_pdf_preview_help'] ??
      _localizedValues['en']!['show_pdf_preview_help']!;

  String get normal =>
      _localizedValues[localeCode]!['normal'] ??
      _localizedValues['en']!['normal']!;

  String get large =>
      _localizedValues[localeCode]!['large'] ??
      _localizedValues['en']!['large']!;

  String get extraLarge =>
      _localizedValues[localeCode]!['extra_large'] ??
      _localizedValues['en']!['extra_large']!;

  String get invoicePaid =>
      _localizedValues[localeCode]!['invoice_paid'] ??
      _localizedValues['en']!['invoice_paid']!;

  String get remaining =>
      _localizedValues[localeCode]!['remaining'] ??
      _localizedValues['en']!['remaining']!;

  String get htmlPreviewWarning =>
      _localizedValues[localeCode]!['html_preview_warning'] ??
      _localizedValues['en']!['html_preview_warning']!;

  String get waitForLoading =>
      _localizedValues[localeCode]!['wait_for_loading'] ??
      _localizedValues['en']!['wait_for_loading']!;

  String get waitForSaving =>
      _localizedValues[localeCode]!['wait_for_saving'] ??
      _localizedValues['en']!['wait_for_saving']!;

  String get markedCreditAsPaid =>
      _localizedValues[localeCode]!['marked_credit_as_paid'] ??
      _localizedValues['en']!['marked_credit_as_paid']!;

  String get markedCreditsAsPaid =>
      _localizedValues[localeCode]!['marked_credits_as_paid'] ??
      _localizedValues['en']!['marked_credits_as_paid']!;

  String get small =>
      _localizedValues[localeCode]!['small'] ??
      _localizedValues['en']!['small']!;

  String get upgradeToAddCompany =>
      _localizedValues[localeCode]!['upgrade_to_add_company'] ??
      _localizedValues['en']!['upgrade_to_add_company']!;

  String get customEmailsDisabledHelp =>
      _localizedValues[localeCode]!['custom_emails_disabled_help'] ??
      _localizedValues['en']!['custom_emails_disabled_help']!;

  String get purgedClient =>
      _localizedValues[localeCode]!['purged_client'] ??
      _localizedValues['en']!['purged_client']!;

  String get convertTo =>
      _localizedValues[localeCode]!['convert_to'] ??
      _localizedValues['en']!['convert_to']!;

  String get clientCurrency =>
      _localizedValues[localeCode]!['client_currency'] ??
      _localizedValues['en']!['client_currency']!;

  String get companyCurrency =>
      _localizedValues[localeCode]!['company_currency'] ??
      _localizedValues['en']!['company_currency']!;

  String get ageGroupPaid =>
      _localizedValues[localeCode]!['age_group_paid'] ??
      _localizedValues['en']!['age_group_paid']!;

  String get id =>
      _localizedValues[localeCode]!['id'] ?? _localizedValues['en']!['id']!;

  String get isPaid =>
      _localizedValues[localeCode]!['is_paid'] ??
      _localizedValues['en']!['is_paid']!;

  String get dueOnReceipt =>
      _localizedValues[localeCode]!['due_on_receipt'] ??
      _localizedValues['en']!['due_on_receipt']!;

  String get startFreeTrialMessage =>
      _localizedValues[localeCode]!['start_free_trial_message'] ??
      _localizedValues['en']!['start_free_trial_message']!;

  String get startFreeTrial =>
      _localizedValues[localeCode]!['start_free_trial'] ??
      _localizedValues['en']!['start_free_trial']!;

  String get loadPdf =>
      _localizedValues[localeCode]!['load_pdf'] ??
      _localizedValues['en']!['load_pdf']!;

  String get clientShippingCity =>
      _localizedValues[localeCode]!['client_shipping_city'] ??
      _localizedValues['en']!['client_shipping_city']!;

  String get clientShippingState =>
      _localizedValues[localeCode]!['client_shipping_state'] ??
      _localizedValues['en']!['client_shipping_state']!;

  String get clientShippingPostalCode =>
      _localizedValues[localeCode]!['client_shipping_postal_code'] ??
      _localizedValues['en']!['client_shipping_postal_code']!;

  String get clientShippingCountry =>
      _localizedValues[localeCode]!['client_shipping_country'] ??
      _localizedValues['en']!['client_shipping_country']!;

  String get invalidTime =>
      _localizedValues[localeCode]!['invalid_time'] ??
      _localizedValues['en']!['invalid_time']!;

  String get clientWebsite =>
      _localizedValues[localeCode]!['client_website'] ??
      _localizedValues['en']!['client_website']!;

  String get approve =>
      _localizedValues[localeCode]!['approve'] ??
      _localizedValues['en']!['approve']!;

  String get approvedQuote =>
      _localizedValues[localeCode]!['approved_quote'] ??
      _localizedValues['en']!['approved_quote']!;

  String get approvedQuotes =>
      _localizedValues[localeCode]!['approved_quotes'] ??
      _localizedValues['en']!['approved_quotes']!;

  String get startedTasks =>
      _localizedValues[localeCode]!['started_tasks'] ??
      _localizedValues['en']!['started_tasks']!;

  String get stoppedTasks =>
      _localizedValues[localeCode]!['stopped_tasks'] ??
      _localizedValues['en']!['stopped_tasks']!;

  String get upgradeToViewReports =>
      _localizedValues[localeCode]!['upgrade_to_view_reports'] ??
      _localizedValues['en']!['upgrade_to_view_reports']!;

  String get releaseNotes =>
      _localizedValues[localeCode]!['release_notes'] ??
      _localizedValues['en']!['release_notes']!;

  String get jsonHelp =>
      _localizedValues[localeCode]!['json_help'] ??
      _localizedValues['en']!['json_help']!;

  String get enableEmailMarkdown =>
      _localizedValues[localeCode]!['enable_email_markdown'] ??
      _localizedValues['en']!['enable_email_markdown']!;

  String get enableEmailMarkdownHelp =>
      _localizedValues[localeCode]!['enable_email_markdown_help'] ??
      _localizedValues['en']!['enable_email_markdown_help']!;

  String get enablePdfMarkdown =>
      _localizedValues[localeCode]!['enable_pdf_markdown'] ??
      _localizedValues['en']!['enable_pdf_markdown']!;

  String get afterSaving =>
      _localizedValues[localeCode]!['after_saving'] ??
      _localizedValues['en']!['after_saving']!;

  String get viewRecord =>
      _localizedValues[localeCode]!['view_record'] ??
      _localizedValues['en']!['view_record']!;

  String get enableTouchEvents =>
      _localizedValues[localeCode]!['enable_touch_events'] ??
      _localizedValues['en']!['enable_touch_events']!;

  String get enableTouchEventsHelp =>
      _localizedValues[localeCode]!['enable_touch_events_help'] ??
      _localizedValues['en']!['enable_touch_events_help']!;

  String get feesSample =>
      _localizedValues[localeCode]!['fees_sample'] ??
      _localizedValues['en']!['fees_sample']!;

  String get changeStatus =>
      _localizedValues[localeCode]!['change_status'] ??
      _localizedValues['en']!['change_status']!;

  String get changedStatus =>
      _localizedValues[localeCode]!['changed_status'] ??
      _localizedValues['en']!['changed_status']!;

  String get cancelInvoice =>
      _localizedValues[localeCode]!['cancel_invoice'] ??
      _localizedValues['en']!['cancel_invoice']!;

  String get viewTask =>
      _localizedValues[localeCode]!['view_task'] ??
      _localizedValues['en']!['view_task']!;

  String get createProject =>
      _localizedValues[localeCode]!['create_project'] ??
      _localizedValues['en']!['create_project']!;

  String get updateProject =>
      _localizedValues[localeCode]!['update_project'] ??
      _localizedValues['en']!['update_project']!;

  String get range =>
      _localizedValues[localeCode]!['range'] ??
      _localizedValues['en']!['range']!;

  String get invoiceCurrency =>
      _localizedValues[localeCode]!['invoice_currency'] ??
      _localizedValues['en']!['invoice_currency']!;

  String get alternatePdfViewer =>
      _localizedValues[localeCode]!['alternate_pdf_viewer'] ??
      _localizedValues['en']!['alternate_pdf_viewer']!;

  String get alternatePdfViewerHelp =>
      _localizedValues[localeCode]!['alternate_pdf_viewer_help'] ??
      _localizedValues['en']!['alternate_pdf_viewer_help']!;

  String get autoArchivePaidInvoices =>
      _localizedValues[localeCode]!['auto_archive_paid_invoices'] ??
      _localizedValues['en']!['auto_archive_paid_invoices']!;

  String get autoArchivePaidInvoicesHelp =>
      _localizedValues[localeCode]!['auto_archive_paid_invoices_help'] ??
      _localizedValues['en']!['auto_archive_paid_invoices_help']!;

  String get autoArchiveCancelledInvoices =>
      _localizedValues[localeCode]!['auto_archive_cancelled_invoices'] ??
      _localizedValues['en']!['auto_archive_cancelled_invoices']!;

  String get autoArchiveCancelledInvoicesHelp =>
      _localizedValues[localeCode]!['auto_archive_cancelled_invoices_help'] ??
      _localizedValues['en']!['auto_archive_cancelled_invoices_help']!;

  String get createdRecord =>
      _localizedValues[localeCode]!['created_record'] ??
      _localizedValues['en']!['created_record']!;

  String get week =>
      _localizedValues[localeCode]!['week'] ?? _localizedValues['en']!['week']!;

  String get addToInvoice =>
      _localizedValues[localeCode]!['add_to_invoice'] ??
      _localizedValues['en']!['add_to_invoice']!;

  String get noInvoicesFound =>
      _localizedValues[localeCode]!['no_invoices_found'] ??
      _localizedValues['en']!['no_invoices_found']!;

  String get registerLabel =>
      _localizedValues[localeCode]!['register_label'] ??
      _localizedValues['en']!['register_label']!;

  String get loginLabel =>
      _localizedValues[localeCode]!['login_label'] ??
      _localizedValues['en']!['login_label']!;

  String get multipleClientError =>
      _localizedValues[localeCode]!['multiple_client_error'] ??
      _localizedValues['en']!['multiple_client_error']!;

  String get enableTooltips =>
      _localizedValues[localeCode]!['enable_tooltips'] ??
      _localizedValues['en']!['enable_tooltips']!;

  String get enableTooltipsHelp =>
      _localizedValues[localeCode]!['enable_tooltips_help'] ??
      _localizedValues['en']!['enable_tooltips_help']!;

  String get addCountry =>
      _localizedValues[localeCode]!['add_country'] ??
      _localizedValues['en']!['add_country']!;

  String get useQuoteTerms =>
      _localizedValues[localeCode]!['use_quote_terms'] ??
      _localizedValues['en']!['use_quote_terms']!;

  String get useQuoteTermsHelp =>
      _localizedValues[localeCode]!['use_quote_terms_help'] ??
      _localizedValues['en']!['use_quote_terms_help']!;

  String get stopOnUnpaid =>
      _localizedValues[localeCode]!['stop_on_unpaid'] ??
      _localizedValues['en']!['stop_on_unpaid']!;

  String get stopOnUnpaidHelp =>
      _localizedValues[localeCode]!['stop_on_unpaid_help'] ??
      _localizedValues['en']!['stop_on_unpaid_help']!;

  String get exportType =>
      _localizedValues[localeCode]!['export_type'] ??
      _localizedValues['en']!['export_type']!;

  String get importFormat =>
      _localizedValues[localeCode]!['import_format'] ??
      _localizedValues['en']!['import_format']!;

  String get exportFormat =>
      _localizedValues[localeCode]!['export_format'] ??
      _localizedValues['en']!['export_format']!;

  String get invoiceItems =>
      _localizedValues[localeCode]!['invoice_items'] ??
      _localizedValues['en']!['invoice_items']!;

  String get quoteItems =>
      _localizedValues[localeCode]!['quote_items'] ??
      _localizedValues['en']!['quote_items']!;

  String get profitloss =>
      _localizedValues[localeCode]!['profitloss'] ??
      _localizedValues['en']!['profitloss']!;

  String get showProductDescription =>
      _localizedValues[localeCode]!['show_product_description'] ??
      _localizedValues['en']!['show_product_description']!;

  String get showProductDescriptionHelp =>
      _localizedValues[localeCode]!['show_product_description_help'] ??
      _localizedValues['en']!['show_product_description_help']!;

  String get invoiceSentNotificationLabel =>
      _localizedValues[localeCode]!['invoice_sent_notification_label'] ??
      _localizedValues['en']!['invoice_sent_notification_label']!;

  String get pageNumbering =>
      _localizedValues[localeCode]!['page_numbering'] ??
      _localizedValues['en']!['page_numbering']!;

  String get pageNumberingAlignment =>
      _localizedValues[localeCode]!['page_numbering_alignment'] ??
      _localizedValues['en']!['page_numbering_alignment']!;

  String get left =>
      _localizedValues[localeCode]!['left'] ?? _localizedValues['en']!['left']!;

  String get right =>
      _localizedValues[localeCode]!['right'] ??
      _localizedValues['en']!['right']!;

  String get center =>
      _localizedValues[localeCode]!['center'] ??
      _localizedValues['en']!['center']!;

  String get addGateway =>
      _localizedValues[localeCode]!['add_gateway'] ??
      _localizedValues['en']!['add_gateway']!;

  String get viewMap =>
      _localizedValues[localeCode]!['view_map'] ??
      _localizedValues['en']!['view_map']!;

  String get setDefaultDesign =>
      _localizedValues[localeCode]!['set_default_design'] ??
      _localizedValues['en']!['set_default_design']!;

  String get addGatewayHelpMessage =>
      _localizedValues[localeCode]!['add_gateway_help_message'] ??
      _localizedValues['en']!['add_gateway_help_message']!;

  String get standing =>
      _localizedValues[localeCode]!['standing'] ??
      _localizedValues['en']!['standing']!;

  String get vat =>
      _localizedValues[localeCode]!['vat'] ?? _localizedValues['en']!['vat']!;

  String get trackInventory =>
      _localizedValues[localeCode]!['track_inventory'] ??
      _localizedValues['en']!['track_inventory']!;

  String get trackInventoryHelp =>
      _localizedValues[localeCode]!['track_inventory_help'] ??
      _localizedValues['en']!['track_inventory_help']!;

  String get stockNotifications =>
      _localizedValues[localeCode]!['stock_notifications'] ??
      _localizedValues['en']!['stock_notifications']!;

  String get stockNotificationsHelp =>
      _localizedValues[localeCode]!['stock_notifications_help'] ??
      _localizedValues['en']!['stock_notifications_help']!;

  String get notificationThreshold =>
      _localizedValues[localeCode]!['notification_threshold'] ??
      _localizedValues['en']!['notification_threshold']!;

  String get stockQuantity =>
      _localizedValues[localeCode]!['stock_quantity'] ??
      _localizedValues['en']!['stock_quantity']!;

  String get defaultWord =>
      _localizedValues[localeCode]!['default'] ??
      _localizedValues['en']!['default']!;

  String get paymentSettings =>
      _localizedValues[localeCode]!['payment_settings'] ??
      _localizedValues['en']!['payment_settings']!;

  String get loginUrl =>
      _localizedValues[localeCode]!['login_url'] ??
      _localizedValues['en']!['login_url']!;

  String get purchaseOrder =>
      _localizedValues[localeCode]!['purchase_order'] ??
      _localizedValues['en']!['purchase_order']!;

  String get purchaseOrders =>
      _localizedValues[localeCode]!['purchase_orders'] ??
      _localizedValues['en']!['purchase_orders']!;

  String get newPurchaseOrder =>
      _localizedValues[localeCode]!['new_purchase_order'] ??
      _localizedValues['en']!['new_purchase_order']!;

  String get createdPurchaseOrder =>
      _localizedValues[localeCode]!['created_purchase_order'] ??
      _localizedValues['en']!['created_purchase_order']!;

  String get updatedPurchaseOrder =>
      _localizedValues[localeCode]!['updated_purchase_order'] ??
      _localizedValues['en']!['updated_purchase_order']!;

  String get archivedPurchaseOrder =>
      _localizedValues[localeCode]!['archived_purchase_order'] ??
      _localizedValues['en']!['archived_purchase_order']!;

  String get deletedPurchaseOrder =>
      _localizedValues[localeCode]!['deleted_purchase_order'] ??
      _localizedValues['en']!['deleted_purchase_order']!;

  String get restoredPurchaseOrder =>
      _localizedValues[localeCode]!['restored_purchase_order'] ??
      _localizedValues['en']!['restored_purchase_order']!;

  String get editPurchaseOrder =>
      _localizedValues[localeCode]!['edit_purchase_order'] ??
      _localizedValues['en']!['edit_purchase_order']!;

  String get searchPurchaseOrder =>
      _localizedValues[localeCode]!['search_purchase_order'] ??
      _localizedValues['en']!['search_purchase_order']!;

  String get requirePurchaseOrderSignature =>
      _localizedValues[localeCode]!['require_purchase_order_signature'] ??
      _localizedValues['en']!['require_purchase_order_signature']!;

  String get requirePurchaseOrderSignatureHelp =>
      _localizedValues[localeCode]!['require_purchase_order_signature_help'] ??
      _localizedValues['en']!['require_purchase_order_signature_help']!;

  String get purchaseOrderTerms =>
      _localizedValues[localeCode]!['purchase_order_terms'] ??
      _localizedValues['en']!['purchase_order_terms']!;

  String get purchaseOrderFooter =>
      _localizedValues[localeCode]!['purchase_order_footer'] ??
      _localizedValues['en']!['purchase_order_footer']!;

  String get purchaseOrderDesign =>
      _localizedValues[localeCode]!['purchase_order_design'] ??
      _localizedValues['en']!['purchase_order_design']!;

  String get enableReactApp =>
      _localizedValues[localeCode]!['enable_react_app'] ??
      _localizedValues['en']!['enable_react_app']!;

  String get emailedPurchaseOrder =>
      _localizedValues[localeCode]!['emailed_purchase_orderk'] ??
      _localizedValues['en']!['emailed_purchase_order']!;

  String get emailedPurchaseOrders =>
      _localizedValues[localeCode]!['emailed_purchase_orders'] ??
      _localizedValues['en']!['emailed_purchase_orders']!;

  String get microsoftSignUp =>
      _localizedValues[localeCode]!['microsoft_sign_up'] ??
      _localizedValues['en']!['microsoft_sign_up']!;

  String get microsoftSignIn =>
      _localizedValues[localeCode]!['microsoft_sign_in'] ??
      _localizedValues['en']!['microsoft_sign_in']!;

  String get disconnectedMicrosoft =>
      _localizedValues[localeCode]!['disconnected_microsoft'] ??
      _localizedValues['en']!['disconnected_microsoft']!;

  String get connectMicrosoft =>
      _localizedValues[localeCode]!['connect_microsoft'] ??
      _localizedValues['en']!['connect_microsoft']!;

  String get disconnectMicrosoft =>
      _localizedValues[localeCode]!['disconnect_microsoft'] ??
      _localizedValues['en']!['disconnect_microsoft']!;

  String get connectedMicrosoft =>
      _localizedValues[localeCode]!['connected_microsoft'] ??
      _localizedValues['en']!['connected_microsoft']!;

  String get emailProvider =>
      _localizedValues[localeCode]!['email_provider'] ??
      _localizedValues['en']!['email_provider']!;

  String get useWebAppToConnectMicrosoft =>
      _localizedValues[localeCode]!['use_web_app_to_connect_microsoft'] ??
      _localizedValues['en']!['use_web_app_to_connect_microsoft']!;

  String get connectEmail =>
      _localizedValues[localeCode]!['connect_email'] ??
      _localizedValues['en']!['connect_email']!;

  String get disconnectEmail =>
      _localizedValues[localeCode]!['disconnect_email'] ??
      _localizedValues['en']!['disconnect_email']!;

  String get disconnectedEmail =>
      _localizedValues[localeCode]!['disconnected_email'] ??
      _localizedValues['en']!['disconnected_email']!;

  String get purchaseOrderTotal =>
      _localizedValues[localeCode]!['purchase_order_total'] ??
      _localizedValues['en']!['purchase_order_total']!;

  String get pleaseSelectAVendor =>
      _localizedValues[localeCode]!['please_select_a_vendor'] ??
      _localizedValues['en']!['please_select_a_vendor']!;

  String get accepted =>
      _localizedValues[localeCode]!['accepted'] ??
      _localizedValues['en']!['accepted']!;

  String get markedPurchaseOrderAsSent =>
      _localizedValues[localeCode]!['marked_purchase_order_as_sent'] ??
      _localizedValues['en']!['marked_purchase_order_as_sent']!;

  String get markedPurchaseOrdersAsSent =>
      _localizedValues[localeCode]!['marked_purchase_orders_as_sent'] ??
      _localizedValues['en']!['marked_purchase_orders_as_sent']!;

  String get acceptedPurchaseOrder =>
      _localizedValues[localeCode]!['accepted_purchase_order'] ??
      _localizedValues['en']!['accepted_purchase_order']!;

  String get acceptedPurchaseOrders =>
      _localizedValues[localeCode]!['accepted_purchase_orders'] ??
      _localizedValues['en']!['accepted_purchase_orders']!;

  String get cancelledPurchaseOrder =>
      _localizedValues[localeCode]!['cancelled_purchase_order'] ??
      _localizedValues['en']!['cancelled_purchase_order']!;

  String get cancelledPurchaseOrders =>
      _localizedValues[localeCode]!['cancelled_purchase_orders'] ??
      _localizedValues['en']!['cancelled_purchase_orders']!;

  String get vendorEmailNotSet =>
      _localizedValues[localeCode]!['vendor_email_not_set'] ??
      _localizedValues['en']!['vendor_email_not_set']!;

  String get cloneToPurchaseOrder =>
      _localizedValues[localeCode]!['clone_to_purchase_order'] ??
      _localizedValues['en']!['clone_to_purchase_order']!;

  String get accept =>
      _localizedValues[localeCode]!['accept'] ??
      _localizedValues['en']!['accept']!;

  String get qrIban =>
      _localizedValues[localeCode]!['qr_iban'] ??
      _localizedValues['en']!['qr_iban']!;

  String get besrId =>
      _localizedValues[localeCode]!['besr_id'] ??
      _localizedValues['en']!['besr_id']!;

  String get vendorDetails =>
      _localizedValues[localeCode]!['vendor_details'] ??
      _localizedValues['en']!['vendor_details']!;

  String get purchaseOrderDetails =>
      _localizedValues[localeCode]!['purchase_order_details'] ??
      _localizedValues['en']!['purchase_order_details']!;

  String get enableFlexibleSearch =>
      _localizedValues[localeCode]!['enable_flexible_search'] ??
      _localizedValues['en']!['enable_flexible_search']!;

  String get enableFlexibleSearchHelp =>
      _localizedValues[localeCode]!['enable_flexible_search_help'] ??
      _localizedValues['en']!['enable_flexible_search_help']!;

  String get lastSentTemplate =>
      _localizedValues[localeCode]!['last_sent_template'] ??
      _localizedValues['en']!['last_sent_template']!;

  String get add =>
      _localizedValues[localeCode]!['add'] ?? _localizedValues['en']!['add']!;

  String get areYouEnjoyingTheApp =>
      _localizedValues[localeCode]!['are_you_enjoying_the_app'] ??
      _localizedValues['en']!['are_you_enjoying_the_app']!;

  String get wouldYouRateIt =>
      _localizedValues[localeCode]!['would_you_rate_it'] ??
      _localizedValues['en']!['would_you_rate_it']!;

  String get wouldYouTellUsMore =>
      _localizedValues[localeCode]!['would_you_tell_us_more'] ??
      _localizedValues['en']!['would_you_tell_us_more']!;

  String get yesItsGreat =>
      _localizedValues[localeCode]!['yes_its_great'] ??
      _localizedValues['en']!['yes_its_great']!;

  String get notSoMuch =>
      _localizedValues[localeCode]!['not_so_much'] ??
      _localizedValues['en']!['not_so_much']!;

  String get sureHappyTo =>
      _localizedValues[localeCode]!['sure_happy_to'] ??
      _localizedValues['en']!['sure_happy_to']!;

  String get noNotNow =>
      _localizedValues[localeCode]!['no_not_now'] ??
      _localizedValues['en']!['no_not_now']!;

  String get vendorDocumentUploadHelp =>
      _localizedValues[localeCode]!['vendor_document_upload_help'] ??
      _localizedValues['en']!['vendor_document_upload_help']!;

  String get vendorDocumentUpload =>
      _localizedValues[localeCode]!['vendor_document_upload'] ??
      _localizedValues['en']!['vendor_document_upload']!;

  String get clientDocumentUpload =>
      _localizedValues[localeCode]!['client_document_upload'] ??
      _localizedValues['en']!['client_document_upload']!;

  String get addedPurchaseOrderToInventory =>
      _localizedValues[localeCode]!['added_purchase_order_to_inventory'] ??
      _localizedValues['en']!['added_purchase_order_to_inventory']!;

  String get addedPurchaseOrdersToInventory =>
      _localizedValues[localeCode]!['added_purchase_orders_to_inventory'] ??
      _localizedValues['en']!['added_purchase_orders_to_inventory']!;

  String get addToInventory =>
      _localizedValues[localeCode]!['add_to_inventory'] ??
      _localizedValues['en']!['add_to_inventory']!;

  String get convertedToExpense =>
      _localizedValues[localeCode]!['converted_to_expense'] ??
      _localizedValues['en']!['converted_to_expense']!;

  String get convertedToExpenses =>
      _localizedValues[localeCode]!['converted_to_expenses'] ??
      _localizedValues['en']!['converted_to_expenses']!;

  String get purchaseOrderDate =>
      _localizedValues[localeCode]!['purchase_order_date'] ??
      _localizedValues['en']!['purchase_order_date']!;

  String get received =>
      _localizedValues[localeCode]!['received'] ??
      _localizedValues['en']!['received']!;

  String get sendNow =>
      _localizedValues[localeCode]!['send_now'] ??
      _localizedValues['en']!['send_now']!;

  String get disconnectedApple =>
      _localizedValues[localeCode]!['disconnected_apple'] ??
      _localizedValues['en']!['disconnected_apple']!;

  String get connectApple =>
      _localizedValues[localeCode]!['connect_apple'] ??
      _localizedValues['en']!['connect_apple']!;

  String get disconnectApple =>
      _localizedValues[localeCode]!['disconnect_apple'] ??
      _localizedValues['en']!['disconnect_apple']!;

  String get activate =>
      _localizedValues[localeCode]!['activate'] ??
      _localizedValues['en']!['activate']!;

  String get restorePurchases =>
      _localizedValues[localeCode]!['restore_purchases'] ??
      _localizedValues['en']!['restore_purchases']!;

  String get priceChangeAccepted =>
      _localizedValues[localeCode]!['price_change_accepted'] ??
      _localizedValues['en']!['price_change_accepted']!;

  String get priceChangeFailed =>
      _localizedValues[localeCode]!['price_change_failed'] ??
      _localizedValues['en']!['price_change_failed']!;

  String get merge =>
      _localizedValues[localeCode]!['merge'] ??
      _localizedValues['en']!['merge']!;

  String get mergeInto =>
      _localizedValues[localeCode]!['merge_into'] ??
      _localizedValues['en']!['merge_into']!;

  String get mergedClients =>
      _localizedValues[localeCode]!['merged_clients'] ??
      _localizedValues['en']!['merged_clients']!;

  String get verifyPhoneNumber =>
      _localizedValues[localeCode]!['verify_phone_number'] ??
      _localizedValues['en']!['verify_phone_number']!;

  String get verifyPhoneNumberHelp =>
      _localizedValues[localeCode]!['verify_phone_number_help'] ??
      _localizedValues['en']!['verify_phone_number_help']!;

  String get invalidPhoneNumber =>
      _localizedValues[localeCode]!['invalid_phone_number'] ??
      _localizedValues['en']!['invalid_phone_number']!;

  String get enterPhoneNumber =>
      _localizedValues[localeCode]!['enter_phone_number'] ??
      _localizedValues['en']!['enter_phone_number']!;

  String get resend =>
      _localizedValues[localeCode]!['resend'] ??
      _localizedValues['en']!['resend']!;

  String get verify =>
      _localizedValues[localeCode]!['verify'] ??
      _localizedValues['en']!['verify']!;

  String get codeWasSent =>
      _localizedValues[localeCode]!['code_was_sent'] ??
      _localizedValues['en']!['code_was_sent']!;

  String get pleaseEnterACode =>
      _localizedValues[localeCode]!['please_enter_a_code'] ??
      _localizedValues['en']!['please_enter_a_code']!;

  String get bulkEmailPurchaseOrders =>
      _localizedValues[localeCode]!['bulk_email_purchase_orders'] ??
      _localizedValues['en']!['bulk_email_purchase_orders']!;

  String get verifiedPhoneNumber =>
      _localizedValues[localeCode]!['verified_phone_number'] ??
      _localizedValues['en']!['verified_phone_number']!;

  String get invoiceItemTaxRates =>
      _localizedValues[localeCode]!['invoice_item_tax_rates'] ??
      _localizedValues['en']!['invoice_item_tax_rates']!;

  String get expenseTaxRates =>
      _localizedValues[localeCode]!['expense_tax_rates'] ??
      _localizedValues['en']!['expense_tax_rates']!;

  String get saveToUploadDocuments =>
      _localizedValues[localeCode]!['save_to_upload_documents'] ??
      _localizedValues['en']!['save_to_upload_documents']!;

  String get sendCode =>
      _localizedValues[localeCode]!['send_code'] ??
      _localizedValues['en']!['send_code']!;

  String get vendorPortal =>
      _localizedValues[localeCode]!['vendor_portal'] ??
      _localizedValues['en']!['vendor_portal']!;

  String get totalActiveInvoices =>
      _localizedValues[localeCode]!['total_active_invoices'] ??
      _localizedValues['en']!['total_active_invoices']!;

  String get totalOutstandingInvoices =>
      _localizedValues[localeCode]!['total_outstanding_invoices'] ??
      _localizedValues['en']!['total_outstanding_invoices']!;

  String get totalCompletedPayments =>
      _localizedValues[localeCode]!['total_completed_payments'] ??
      _localizedValues['en']!['total_completed_payments']!;

  String get totalRefundedPayments =>
      _localizedValues[localeCode]!['total_refunded_payments'] ??
      _localizedValues['en']!['total_refunded_payments']!;

  String get totalActiveQuotes =>
      _localizedValues[localeCode]!['total_active_quotes'] ??
      _localizedValues['en']!['total_active_quotes']!;

  String get totalUnapprovedQuotes =>
      _localizedValues[localeCode]!['total_unapproved_quotes'] ??
      _localizedValues['en']!['total_unapproved_quotes']!;

  String get totalApprovedQuotes =>
      _localizedValues[localeCode]!['total_approved_quotes'] ??
      _localizedValues['en']!['total_approved_quotes']!;

  String get totalLoggedTasks =>
      _localizedValues[localeCode]!['total_logged_tasks'] ??
      _localizedValues['en']!['total_logged_tasks']!;

  String get totalInvoicedTasks =>
      _localizedValues[localeCode]!['total_invoiced_tasks'] ??
      _localizedValues['en']!['total_invoiced_tasks']!;

  String get totalPaidTasks =>
      _localizedValues[localeCode]!['total_paid_tasks'] ??
      _localizedValues['en']!['total_paid_tasks']!;

  String get totalLoggedExpenses =>
      _localizedValues[localeCode]!['total_logged_expenses'] ??
      _localizedValues['en']!['total_logged_expenses']!;

  String get totalPendingExpenses =>
      _localizedValues[localeCode]!['total_pending_expenses'] ??
      _localizedValues['en']!['total_pending_expenses']!;

  String get totalInvoicedExpenses =>
      _localizedValues[localeCode]!['total_invoiced_expenses'] ??
      _localizedValues['en']!['total_invoiced_expenses']!;

  String get totalInvoicePaidExpenses =>
      _localizedValues[localeCode]!['total_invoice_paid_expenses'] ??
      _localizedValues['en']!['total_invoice_paid_expenses']!;

  String get fieldsPerRow =>
      _localizedValues[localeCode]!['fields_per_row'] ??
      _localizedValues['en']!['fields_per_row']!;

  String get field =>
      _localizedValues[localeCode]!['field'] ??
      _localizedValues['en']!['field']!;

  String get period =>
      _localizedValues[localeCode]!['period'] ??
      _localizedValues['en']!['period']!;

  String get invoiceTaskProject =>
      _localizedValues[localeCode]!['invoice_task_project'] ??
      _localizedValues['en']!['invoice_task_project']!;

  String get invoiceTaskProjectHelp =>
      _localizedValues[localeCode]!['invoice_task_project_help'] ??
      _localizedValues['en']!['invoice_task_project_help']!;

  String get clientEmail =>
      _localizedValues[localeCode]!['client_email'] ??
      _localizedValues['en']!['client_email']!;

  String get convertToProject =>
      _localizedValues[localeCode]!['convert_to_project'] ??
      _localizedValues['en']!['convert_to_project']!;

  String get markPaidPaymentEmail =>
      _localizedValues[localeCode]!['mark_paid_payment_email'] ??
      _localizedValues['en']!['mark_paid_payment_email']!;

  String get bankAccounts =>
      _localizedValues[localeCode]!['bank_accounts'] ??
      _localizedValues['en']!['bank_accounts']!;

  String get connect =>
      _localizedValues[localeCode]!['connect'] ??
      _localizedValues['en']!['connect']!;

  String get bankAccount =>
      _localizedValues[localeCode]!['bank_account'] ??
      _localizedValues['en']!['bank_account']!;

  String get archivedBankAccount =>
      _localizedValues[localeCode]!['archived_bank_account'] ??
      _localizedValues['en']!['archived_bank_account']!;

  String get deletedBankAccount =>
      _localizedValues[localeCode]!['deleted_bank_account'] ??
      _localizedValues['en']!['deleted_bank_account']!;

  String get restoredBankAccount =>
      _localizedValues[localeCode]!['restored_bank_account'] ??
      _localizedValues['en']!['restored_bank_account']!;

  String get searchBankAccount =>
      _localizedValues[localeCode]!['search_bank_account'] ??
      _localizedValues['en']!['search_bank_account']!;

  String get transaction =>
      _localizedValues[localeCode]!['transaction'] ??
      _localizedValues['en']!['transaction']!;

  String get transactions =>
      _localizedValues[localeCode]!['transactions'] ??
      _localizedValues['en']!['transactions']!;

  String get newTransaction =>
      _localizedValues[localeCode]!['new_transaction'] ??
      _localizedValues['en']!['new_transaction']!;

  String get createdTransaction =>
      _localizedValues[localeCode]!['created_transaction'] ??
      _localizedValues['en']!['created_transaction']!;

  String get updatedTransaction =>
      _localizedValues[localeCode]!['updated_transaction'] ??
      _localizedValues['en']!['updated_transaction']!;

  String get archivedTransaction =>
      _localizedValues[localeCode]!['archived_transaction'] ??
      _localizedValues['en']!['archived_transaction']!;

  String get deletedTransaction =>
      _localizedValues[localeCode]!['deleted_transaction'] ??
      _localizedValues['en']!['deleted_transaction']!;

  String get restoredTransaction =>
      _localizedValues[localeCode]!['restored_transaction'] ??
      _localizedValues['en']!['restored_transaction']!;

  String get editTransaction =>
      _localizedValues[localeCode]!['edit_transaction'] ??
      _localizedValues['en']!['edit_transaction']!;

  String get searchTransaction =>
      _localizedValues[localeCode]!['search_transaction'] ??
      _localizedValues['en']!['search_transaction']!;

  String get searchTransactions =>
      _localizedValues[localeCode]!['search_transactions'] ??
      _localizedValues['en']!['search_transactions']!;

  String get createCredit =>
      _localizedValues[localeCode]!['create_credit'] ??
      _localizedValues['en']!['create_credit']!;

  String get updateCredit =>
      _localizedValues[localeCode]!['update_credit'] ??
      _localizedValues['en']!['update_credit']!;

  String get deleteCredit =>
      _localizedValues[localeCode]!['delete_credit'] ??
      _localizedValues['en']!['delete_credit']!;

  String get matched =>
      _localizedValues[localeCode]!['matched'] ??
      _localizedValues['en']!['matched']!;

  String get unmatched =>
      _localizedValues[localeCode]!['unmatched'] ??
      _localizedValues['en']!['unmatched']!;

  String get deposit =>
      _localizedValues[localeCode]!['deposit'] ??
      _localizedValues['en']!['deposit']!;

  String get withdrawal =>
      _localizedValues[localeCode]!['withdrawal'] ??
      _localizedValues['en']!['withdrawal']!;

  String get deposits =>
      _localizedValues[localeCode]!['deposits'] ??
      _localizedValues['en']!['deposits']!;

  String get withdrawals =>
      _localizedValues[localeCode]!['withdrawals'] ??
      _localizedValues['en']!['withdrawals']!;

  String get convertedTransaction =>
      _localizedValues[localeCode]!['converted_transaction'] ??
      _localizedValues['en']!['converted_transaction']!;

  String get convertedTransactions =>
      _localizedValues[localeCode]!['converted_transactions'] ??
      _localizedValues['en']!['converted_transactions']!;

  String get selected =>
      _localizedValues[localeCode]!['selected'] ??
      _localizedValues['en']!['selected']!;

  String get minAmount =>
      _localizedValues[localeCode]!['min_amount'] ??
      _localizedValues['en']!['min_amount']!;

  String get maxAmount =>
      _localizedValues[localeCode]!['max_amount'] ??
      _localizedValues['en']!['max_amount']!;

  String get searchCategory =>
      _localizedValues[localeCode]!['search_category'] ??
      _localizedValues['en']!['search_category']!;

  String get searchCategories =>
      _localizedValues[localeCode]!['search_categories'] ??
      _localizedValues['en']!['search_categories']!;

  String get connectAccounts =>
      _localizedValues[localeCode]!['connect_accounts'] ??
      _localizedValues['en']!['connect_accounts']!;

  String get manageRules =>
      _localizedValues[localeCode]!['manage_rules'] ??
      _localizedValues['en']!['manage_rules']!;

  String get newBankAccount =>
      _localizedValues[localeCode]!['new_bank_account'] ??
      _localizedValues['en']!['new_bank_account']!;

  String get editBankAccount =>
      _localizedValues[localeCode]!['edit_bank_account'] ??
      _localizedValues['en']!['edit_bank_account']!;

  String get accountType =>
      _localizedValues[localeCode]!['account_type'] ??
      _localizedValues['en']!['account_type']!;

  String get defaultCategory =>
      _localizedValues[localeCode]!['default_category'] ??
      _localizedValues['en']!['default_category']!;

  String get createdBankAccount =>
      _localizedValues[localeCode]!['created_bank_account'] ??
      _localizedValues['en']!['created_bank_account']!;

  String get updatedBankAccount =>
      _localizedValues[localeCode]!['updated_bank_account'] ??
      _localizedValues['en']!['updated_bank_account']!;

  String get dueOn =>
      _localizedValues[localeCode]!['due_on'] ??
      _localizedValues['en']!['due_on']!;

  String get includeDeleted =>
      _localizedValues[localeCode]!['include_deleted'] ??
      _localizedValues['en']!['include_deleted']!;

  String get includeDeletedHelp =>
      _localizedValues[localeCode]!['include_deleted_help'] ??
      _localizedValues['en']!['include_deleted_help']!;

  String get wouldYouRateTheApp =>
      _localizedValues[localeCode]!['would_you_rate_the_app'] ??
      _localizedValues['en']!['would_you_rate_the_app']!;

  String get purchaseOrderItem =>
      _localizedValues[localeCode]!['purchase_order_item'] ??
      _localizedValues['en']!['purchase_order_item']!;

  String get purchaseOrderNumber =>
      _localizedValues[localeCode]!['purchase_order_number'] ??
      _localizedValues['en']!['purchase_order_number']!;

  String get longPressToSelect =>
      _localizedValues[localeCode]!['long_press_to_select'] ??
      _localizedValues['en']!['long_press_to_select']!;

  String get pdfPreview =>
      _localizedValues[localeCode]!['pdf_preview'] ??
      _localizedValues['en']!['pdf_preview']!;

  String get previewLocation =>
      _localizedValues[localeCode]!['preview_location'] ??
      _localizedValues['en']!['preview_location']!;

  String get bottom =>
      _localizedValues[localeCode]!['bottom'] ??
      _localizedValues['en']!['bottom']!;

  String get side =>
      _localizedValues[localeCode]!['side'] ?? _localizedValues['en']!['side']!;

  String get vendorPostalCode =>
      _localizedValues[localeCode]!['vendor_postal_code'] ??
      _localizedValues['en']!['vendor_postal_code']!;

  String get bulkPrint =>
      _localizedValues[localeCode]!['bulk_print'] ??
      _localizedValues['en']!['bulk_print']!;

  String get bankTransaction =>
      _localizedValues[localeCode]!['bank_transaction'] ??
      _localizedValues['en']!['bank_transaction']!;

  String get baseType =>
      _localizedValues[localeCode]!['base_type'] ??
      _localizedValues['en']!['base_type']!;

  String get categoryType =>
      _localizedValues[localeCode]!['category_type'] ??
      _localizedValues['en']!['category_type']!;

  String get resendCode =>
      _localizedValues[localeCode]!['resend_code'] ??
      _localizedValues['en']!['resend_code']!;

  String get verifyPhoneNumber2faHelp =>
      _localizedValues[localeCode]!['verify_phone_number_2fa_help'] ??
      _localizedValues['en']!['verify_phone_number_2fa_help']!;

  String get codeWasSentTo =>
      _localizedValues[localeCode]!['code_was_sent_to'] ??
      _localizedValues['en']!['code_was_sent_to']!;

  String get changeNumber =>
      _localizedValues[localeCode]!['change_number'] ??
      _localizedValues['en']!['change_number']!;

  String get disable2fa =>
      _localizedValues[localeCode]!['disable_2fa'] ??
      _localizedValues['en']!['disable_2fa']!;

  String get upgradeToConnectBankAccount =>
      _localizedValues[localeCode]!['upgrade_to_connect_bank_account'] ??
      _localizedValues['en']!['upgrade_to_connect_bank_account']!;

  String get clickHereToConnectBankAccount =>
      _localizedValues[localeCode]!['click_here_to_connect_bank_account'] ??
      _localizedValues['en']!['click_here_to_connect_bank_account']!;

  String get refreshAccounts =>
      _localizedValues[localeCode]!['refresh_accounts'] ??
      _localizedValues['en']!['refresh_accounts']!;

  String get autoSync =>
      _localizedValues[localeCode]!['auto_sync'] ??
      _localizedValues['en']!['auto_sync']!;

  String get saveAsDefaultTerms =>
      _localizedValues[localeCode]!['save_as_default_terms'] ??
      _localizedValues['en']!['save_as_default_terms']!;

  String get saveAsDefaultFooter =>
      _localizedValues[localeCode]!['save_as_default_footer'] ??
      _localizedValues['en']!['save_as_default_footer']!;

  String get transactionRule =>
      _localizedValues[localeCode]!['transaction_rule'] ??
      _localizedValues['en']!['transaction_rule']!;

  String get transactionRules =>
      _localizedValues[localeCode]!['transaction_rules'] ??
      _localizedValues['en']!['transaction_rules']!;

  String get newTransactionRule =>
      _localizedValues[localeCode]!['new_transaction_rule'] ??
      _localizedValues['en']!['new_transaction_rule']!;

  String get createdTransactionRule =>
      _localizedValues[localeCode]!['created_transaction_rule'] ??
      _localizedValues['en']!['created_transaction_rule']!;

  String get updatedTransactionRule =>
      _localizedValues[localeCode]!['updated_transaction_rule'] ??
      _localizedValues['en']!['updated_transaction_rule']!;

  String get archivedTransactionRule =>
      _localizedValues[localeCode]!['archived_transaction_rule'] ??
      _localizedValues['en']!['archived_transaction_rule']!;

  String get deletedTransactionRule =>
      _localizedValues[localeCode]!['deleted_transaction_rule'] ??
      _localizedValues['en']!['deleted_transaction_rule']!;

  String get restoredTransactionRule =>
      _localizedValues[localeCode]!['restored_transaction_rule'] ??
      _localizedValues['en']!['restored_transaction_rule']!;

  String get editTransactionRule =>
      _localizedValues[localeCode]!['edit_transaction_rule'] ??
      _localizedValues['en']!['edit_transaction_rule']!;

  String get searchTransactionRule =>
      _localizedValues[localeCode]!['search_transaction_rule'] ??
      _localizedValues['en']!['search_transaction_rule']!;

  String get searchTransactionRules =>
      _localizedValues[localeCode]!['search_transaction_rules'] ??
      _localizedValues['en']!['search_transaction_rules']!;

  String get rules =>
      _localizedValues[localeCode]!['rules'] ??
      _localizedValues['en']!['rules']!;

  String get matchAllRulesHelp =>
      _localizedValues[localeCode]!['match_all_rules_help'] ??
      _localizedValues['en']!['match_all_rules_help']!;

  String get matchAllRules =>
      _localizedValues[localeCode]!['match_all_rules'] ??
      _localizedValues['en']!['match_all_rules']!;

  String get autoConvertHelp =>
      _localizedValues[localeCode]!['auto_convert_help'] ??
      _localizedValues['en']!['auto_convert_help']!;

  String get addRule =>
      _localizedValues[localeCode]!['add_rule'] ??
      _localizedValues['en']!['add_rule']!;

  String get isWord =>
      _localizedValues[localeCode]!['is'] ?? _localizedValues['en']!['is']!;

  String get contains =>
      _localizedValues[localeCode]!['contains'] ??
      _localizedValues['en']!['contains']!;

  String get startsWith =>
      _localizedValues[localeCode]!['starts_with'] ??
      _localizedValues['en']!['starts_with']!;

  String get isEmpty =>
      _localizedValues[localeCode]!['is_empty'] ??
      _localizedValues['en']!['is_empty']!;

  String get value =>
      _localizedValues[localeCode]!['value'] ??
      _localizedValues['en']!['value']!;

  String get operator =>
      _localizedValues[localeCode]!['operator'] ??
      _localizedValues['en']!['operator']!;

  String get autoBilledInvoice =>
      _localizedValues[localeCode]!['auto_billed_invoice'] ??
      _localizedValues['en']!['auto_billed_invoice']!;

  String get autoBilledInvoices =>
      _localizedValues[localeCode]!['auto_billed_invoices'] ??
      _localizedValues['en']!['auto_billed_invoices']!;

  String get convertMatched =>
      _localizedValues[localeCode]!['convert_matched'] ??
      _localizedValues['en']!['convert_matched']!;

  String get optionalProducts =>
      _localizedValues[localeCode]!['optional_products'] ??
      _localizedValues['en']!['optional_products']!;

  String get optionalRecurringProducts =>
      _localizedValues[localeCode]!['optional_recurring_products'] ??
      _localizedValues['en']!['optional_recurring_products']!;

  String get registrationRequired =>
      _localizedValues[localeCode]!['registration_required'] ??
      _localizedValues['en']!['registration_required']!;

  String get registrationRequiredHelp =>
      _localizedValues[localeCode]!['registration_required_help'] ??
      _localizedValues['en']!['registration_required_help']!;

  String get useInventoryManagement =>
      _localizedValues[localeCode]!['use_inventory_management'] ??
      _localizedValues['en']!['use_inventory_management']!;

  String get useInventoryManagementHelp =>
      _localizedValues[localeCode]!['use_inventory_management_help'] ??
      _localizedValues['en']!['use_inventory_management_help']!;

  String get lockInvoicedTasks =>
      _localizedValues[localeCode]!['lock_invoiced_tasks'] ??
      _localizedValues['en']!['lock_invoiced_tasks']!;

  String get lockInvoicedTasksHelp =>
      _localizedValues[localeCode]!['lock_invoiced_tasks_help'] ??
      _localizedValues['en']!['lock_invoiced_tasks_help']!;

  String get linkPayment =>
      _localizedValues[localeCode]!['link_payment'] ??
      _localizedValues['en']!['link_payment']!;

  String get linkExpense =>
      _localizedValues[localeCode]!['link_expense'] ??
      _localizedValues['en']!['link_expense']!;

  String get linkExpenses =>
      _localizedValues[localeCode]!['link_expenses'] ??
      _localizedValues['en']!['link_expenses']!;

  String get linkedTransaction =>
      _localizedValues[localeCode]!['linked_transaction'] ??
      _localizedValues['en']!['linked_transaction']!;

  String get deleteProject =>
      _localizedValues[localeCode]!['delete_project'] ??
      _localizedValues['en']!['delete_project']!;

  String get onlinePaymentEmailHelp =>
      _localizedValues[localeCode]!['online_payment_email_help'] ??
      _localizedValues['en']!['online_payment_email_help']!;

  String get manualPaymentEmailHelp =>
      _localizedValues[localeCode]!['manual_payment_email_help'] ??
      _localizedValues['en']!['manual_payment_email_help']!;

  String get markPaidPaymentEmailHelp =>
      _localizedValues[localeCode]!['mark_paid_payment_email_help'] ??
      _localizedValues['en']!['mark_paid_payment_email_help']!;

  String get matomoUrl =>
      _localizedValues[localeCode]!['matomo_url'] ??
      _localizedValues['en']!['matomo_url']!;

  String get matomoId =>
      _localizedValues[localeCode]!['matomo_id'] ??
      _localizedValues['en']!['matomo_id']!;

  String get convertPaymentCurrencyHelp =>
      _localizedValues[localeCode]!['convert_payment_currency_help'] ??
      _localizedValues['en']!['convert_payment_currency_help']!;

  String get convertExpenseCurrencyHelp =>
      _localizedValues[localeCode]!['convert_expense_currency_help'] ??
      _localizedValues['en']!['convert_expense_currency_help']!;

  String get creditPaymentError =>
      _localizedValues[localeCode]!['credit_payment_error'] ??
      _localizedValues['en']!['credit_payment_error']!;

  String get markup =>
      _localizedValues[localeCode]!['markup'] ??
      _localizedValues['en']!['markup']!;

  String get updatePayment =>
      _localizedValues[localeCode]!['update_payment'] ??
      _localizedValues['en']!['update_payment']!;

  String get notifyVendorWhenPaid =>
      _localizedValues[localeCode]!['notify_vendor_when_paid'] ??
      _localizedValues['en']!['notify_vendor_when_paid']!;

  String get notifyVendorWhenPaidHelp =>
      _localizedValues[localeCode]!['notify_vendor_when_paid_help'] ??
      _localizedValues['en']!['notify_vendor_when_paid_help']!;

  String get installedVersion =>
      _localizedValues[localeCode]!['installed_version'] ??
      _localizedValues['en']!['installed_version']!;

  String get setupWizardLogo =>
      _localizedValues[localeCode]!['setup_wizard_logo'] ??
      _localizedValues['en']!['setup_wizard_logo']!;

  String get upload =>
      _localizedValues[localeCode]!['upload'] ??
      _localizedValues['en']!['upload']!;

  String get importDesign =>
      _localizedValues[localeCode]!['import_design'] ??
      _localizedValues['en']!['import_design']!;

  String get importedDesign =>
      _localizedValues[localeCode]!['imported_design'] ??
      _localizedValues['en']!['imported_design']!;

  String get invalidDesign =>
      _localizedValues[localeCode]!['invalid_design'] ??
      _localizedValues['en']!['invalid_design']!;

  String get last365Days =>
      _localizedValues[localeCode]!['last365_days'] ??
      _localizedValues['en']!['last365_days']!;

  String get clickPlusToCreateRecord =>
      _localizedValues[localeCode]!['click_plus_to_create_record'] ??
      _localizedValues['en']!['click_plus_to_create_record']!;

  String get emailAlignment =>
      _localizedValues[localeCode]!['email_alignment'] ??
      _localizedValues['en']!['email_alignment']!;

  String get autoBillStandardInvoices =>
      _localizedValues[localeCode]!['auto_bill_standard_invoices'] ??
      _localizedValues['en']!['auto_bill_standard_invoices']!;

  String get autoBillRecurringInvoices =>
      _localizedValues[localeCode]!['auto_bill_recurring_invoices'] ??
      _localizedValues['en']!['auto_bill_recurring_invoices']!;

  String get invoiceTaskHours =>
      _localizedValues[localeCode]!['invoice_task_hours'] ??
      _localizedValues['en']!['invoice_task_hours']!;

  String get invoiceTaskHoursHelp =>
      _localizedValues[localeCode]!['invoice_task_hours_help'] ??
      _localizedValues['en']!['invoice_task_hours_help']!;

  String get showEmailFooter =>
      _localizedValues[localeCode]!['show_email_footer'] ??
      _localizedValues['en']!['show_email_footer']!;

  String get emailedStatement =>
      _localizedValues[localeCode]!['emailed_statement'] ??
      _localizedValues['en']!['emailed_statement']!;

  String get hour =>
      _localizedValues[localeCode]!['hour'] ?? _localizedValues['en']!['hour']!;

  String get inventoryThreshold =>
      _localizedValues[localeCode]!['inventory_threshold'] ??
      _localizedValues['en']!['inventory_threshold']!;

  String get syncFrom =>
      _localizedValues[localeCode]!['sync_from'] ??
      _localizedValues['en']!['sync_from']!;

  String get clientContacts =>
      _localizedValues[localeCode]!['client_contacts'] ??
      _localizedValues['en']!['client_contacts']!;

  String get failed =>
      _localizedValues[localeCode]!['failed'] ??
      _localizedValues['en']!['failed']!;

  String get postalCity =>
      _localizedValues[localeCode]!['postal_city'] ??
      _localizedValues['en']!['postal_city']!;

  String get logoSize =>
      _localizedValues[localeCode]!['logo_size'] ??
      _localizedValues['en']!['logo_size']!;

  String get pixels =>
      _localizedValues[localeCode]!['pixels'] ??
      _localizedValues['en']!['pixels']!;

  String get noDocumentsToDownload =>
      _localizedValues[localeCode]!['no_documents_to_download'] ??
      _localizedValues['en']!['no_documents_to_download']!;

  String get showPaidStamp =>
      _localizedValues[localeCode]!['show_paid_stamp'] ??
      _localizedValues['en']!['show_paid_stamp']!;

  String get showShippingAddress =>
      _localizedValues[localeCode]!['show_shipping_address'] ??
      _localizedValues['en']!['show_shipping_address']!;

  String get showPreview =>
      _localizedValues[localeCode]!['show_preview'] ??
      _localizedValues['en']!['show_preview']!;

  String get fromEmail =>
      _localizedValues[localeCode]!['from_email'] ??
      _localizedValues['en']!['from_email']!;

  String get acceptPurchaseOrderNumber =>
      _localizedValues[localeCode]!['accept_purchase_order_number'] ??
      _localizedValues['en']!['accept_purchase_order_number']!;

  String get acceptPurchaseOrderNumberHelp =>
      _localizedValues[localeCode]!['accept_purchase_order_number_help'] ??
      _localizedValues['en']!['accept_purchase_order_number_help']!;

  String get viewAll =>
      _localizedValues[localeCode]!['view_all'] ??
      _localizedValues['en']!['view_all']!;

  String get editAll =>
      _localizedValues[localeCode]!['edit_all'] ??
      _localizedValues['en']!['edit_all']!;

  String get paymentMethods =>
      _localizedValues[localeCode]!['payment_methods'] ??
      _localizedValues['en']!['payment_methods']!;

  String get testUrl =>
      _localizedValues[localeCode]!['test_url'] ??
      _localizedValues['en']!['test_url']!;

  String get maxQuantity =>
      _localizedValues[localeCode]!['max_quantity'] ??
      _localizedValues['en']!['max_quantity']!;

  String get imageUrl =>
      _localizedValues[localeCode]!['image_url'] ??
      _localizedValues['en']!['image_url']!;

  String get schedules =>
      _localizedValues[localeCode]!['schedules'] ??
      _localizedValues['en']!['schedules']!;

  String get newSchedule =>
      _localizedValues[localeCode]!['new_schedule'] ??
      _localizedValues['en']!['new_schedule']!;

  String get createdSchedule =>
      _localizedValues[localeCode]!['created_schedule'] ??
      _localizedValues['en']!['created_schedule']!;

  String get updatedSchedule =>
      _localizedValues[localeCode]!['updated_schedule'] ??
      _localizedValues['en']!['updated_schedule']!;

  String get archivedSchedule =>
      _localizedValues[localeCode]!['archived_schedule'] ??
      _localizedValues['en']!['archived_schedule']!;

  String get deletedSchedule =>
      _localizedValues[localeCode]!['deleted_schedule'] ??
      _localizedValues['en']!['deleted_schedule']!;

  String get restoredSchedule =>
      _localizedValues[localeCode]!['restored_schedule'] ??
      _localizedValues['en']!['restored_schedule']!;

  String get editSchedule =>
      _localizedValues[localeCode]!['edit_schedule'] ??
      _localizedValues['en']!['edit_schedule']!;

  String get searchSchedule =>
      _localizedValues[localeCode]!['search_schedule'] ??
      _localizedValues['en']!['search_schedule']!;

  String get searchSchedules =>
      _localizedValues[localeCode]!['search_schedules'] ??
      _localizedValues['en']!['search_schedules']!;

  String get once =>
      _localizedValues[localeCode]!['once'] ?? _localizedValues['en']!['once']!;

  String get emailStatement =>
      _localizedValues[localeCode]!['email_statement'] ??
      _localizedValues['en']!['email_statement']!;

  String get showAgingTable =>
      _localizedValues[localeCode]!['show_aging_table'] ??
      _localizedValues['en']!['show_aging_table']!;

  String get showPaymentsTable =>
      _localizedValues[localeCode]!['show_payments_table'] ??
      _localizedValues['en']!['show_payments_table']!;

  String get onlyClientsWithInvoices =>
      _localizedValues[localeCode]!['only_clients_with_invoices'] ??
      _localizedValues['en']!['only_clients_with_invoices']!;

  String get allClients =>
      _localizedValues[localeCode]!['all_clients'] ??
      _localizedValues['en']!['all_clients']!;

  String get nextRun =>
      _localizedValues[localeCode]!['next_run'] ??
      _localizedValues['en']!['next_run']!;

  String get upgradeToPaidPlanToSchedule =>
      _localizedValues[localeCode]!['upgrade_to_paid_plan_to_schedule'] ??
      _localizedValues['en']!['upgrade_to_paid_plan_to_schedule']!;

  String get action =>
      _localizedValues[localeCode]!['action'] ??
      _localizedValues['en']!['action']!;

  String get hidden =>
      _localizedValues[localeCode]!['hidden'] ??
      _localizedValues['en']!['hidden']!;

  String get requiredWord =>
      _localizedValues[localeCode]!['required'] ??
      _localizedValues['en']!['required']!;

  String get oneTimeProducts =>
      _localizedValues[localeCode]!['one_time_products'] ??
      _localizedValues['en']!['one_time_products']!;

  String get optionalOneTimeProducts =>
      _localizedValues[localeCode]!['optional_one_time_products'] ??
      _localizedValues['en']!['optional_one_time_products']!;

  String get viewReportPermission =>
      _localizedValues[localeCode]!['view_report_permission'] ??
      _localizedValues['en']!['view_report_permission']!;

  String get paymentBalance =>
      _localizedValues[localeCode]!['payment_balance'] ??
      _localizedValues['en']!['payment_balance']!;

  String get clientInitiatedPayments =>
      _localizedValues[localeCode]!['client_initiated_payments'] ??
      _localizedValues['en']!['client_initiated_payments']!;

  String get clientInitiatedPaymentsHelp =>
      _localizedValues[localeCode]!['client_initiated_payments_help'] ??
      _localizedValues['en']!['client_initiated_payments_help']!;

  String get shareInvoiceQuoteColumns =>
      _localizedValues[localeCode]!['share_invoice_quote_columns'] ??
      _localizedValues['en']!['share_invoice_quote_columns']!;

  String get minimumPaymentAmount =>
      _localizedValues[localeCode]!['minimum_payment_amount'] ??
      _localizedValues['en']!['minimum_payment_amount']!;

  String get ccEmail =>
      _localizedValues[localeCode]!['cc_email'] ??
      _localizedValues['en']!['cc_email']!;

  String get invoiceProductColumns =>
      _localizedValues[localeCode]!['invoice_product_columns'] ??
      _localizedValues['en']!['invoice_product_columns']!;

  String get quoteProductColumns =>
      _localizedValues[localeCode]!['quote_product_columns'] ??
      _localizedValues['en']!['quote_product_columns']!;

  String get emailRecord =>
      _localizedValues[localeCode]!['email_record'] ??
      _localizedValues['en']!['email_record']!;

  String get invoiceOutstandingTasks =>
      _localizedValues[localeCode]!['invoice_outstanding_tasks'] ??
      _localizedValues['en']!['invoice_outstanding_tasks']!;

  String get paymentSchedule =>
      _localizedValues[localeCode]!['payment_schedule'] ??
      _localizedValues['en']!['payment_schedule']!;

  String get autoSend =>
      _localizedValues[localeCode]!['auto_send'] ??
      _localizedValues['en']!['auto_send']!;

  String get includeProjectTasks =>
      _localizedValues[localeCode]!['include_project_tasks'] ??
      _localizedValues['en']!['include_project_tasks']!;

  String get allowBillableTaskItems =>
      _localizedValues[localeCode]!['allow_billable_task_items'] ??
      _localizedValues['en']!['allow_billable_task_items']!;

  String get allowBillableTaskItemsHelp =>
      _localizedValues[localeCode]!['allow_billable_task_items_help'] ??
      _localizedValues['en']!['allow_billable_task_items_help']!;

  String get showTaskItemDescription =>
      _localizedValues[localeCode]!['show_task_item_description'] ??
      _localizedValues['en']!['show_task_item_description']!;

  String get showTaskItemDescriptionHelp =>
      _localizedValues[localeCode]!['show_task_item_description_help'] ??
      _localizedValues['en']!['show_task_item_description_help']!;

  String get billable =>
      _localizedValues[localeCode]!['billable'] ??
      _localizedValues['en']!['billable']!;

  String get notBillable =>
      _localizedValues[localeCode]!['not_billable'] ??
      _localizedValues['en']!['not_billable']!;

  String get endpoint =>
      _localizedValues[localeCode]!['endpoint'] ??
      _localizedValues['en']!['endpoint']!;

  String get apiKey =>
      _localizedValues[localeCode]!['api_key'] ??
      _localizedValues['en']!['api_key']!;

  String get apiToken =>
      _localizedValues[localeCode]!['api_token'] ??
      _localizedValues['en']!['api_token']!;

  String get increasePrices =>
      _localizedValues[localeCode]!['increase_prices'] ??
      _localizedValues['en']!['increase_prices']!;

  String get updatePrices =>
      _localizedValues[localeCode]!['update_prices'] ??
      _localizedValues['en']!['update_prices']!;

  String get incresedPrices =>
      _localizedValues[localeCode]!['incresed_prices'] ??
      _localizedValues['en']!['incresed_prices']!;

  String get updatedPrices =>
      _localizedValues[localeCode]!['updated_prices'] ??
      _localizedValues['en']!['updated_prices']!;

  String get browserPdfViewer =>
      _localizedValues[localeCode]!['browser_pdf_viewer'] ??
      _localizedValues['en']!['browser_pdf_viewer']!;

  String get browserPdfViewerHelp =>
      _localizedValues[localeCode]!['browser_pdf_viewer_help'] ??
      _localizedValues['en']!['browser_pdf_viewer_help']!;

  String get datePickerHint =>
      _localizedValues[localeCode]!['date_picker_hint'] ??
      _localizedValues['en']!['date_picker_hint']!;

  String get totalHours =>
      _localizedValues[localeCode]!['total_hours'] ??
      _localizedValues['en']!['total_hours']!;

  String get owner =>
      _localizedValues[localeCode]!['owner'] ??
      _localizedValues['en']!['owner']!;

  String get admin =>
      _localizedValues[localeCode]!['admin'] ??
      _localizedValues['en']!['admin']!;

  String get calculateTaxes =>
      _localizedValues[localeCode]!['calculate_taxes'] ??
      _localizedValues['en']!['calculate_taxes']!;

  String get calculateTaxesHelp =>
      _localizedValues[localeCode]!['calculate_taxes_help'] ??
      _localizedValues['en']!['calculate_taxes_help']!;

  String get sellerSubregion =>
      _localizedValues[localeCode]!['seller_subregion'] ??
      _localizedValues['en']!['seller_subregion']!;

  String get version =>
      _localizedValues[localeCode]!['version'] ??
      _localizedValues['en']!['version']!;

  String get taxAll =>
      _localizedValues[localeCode]!['tax_all'] ??
      _localizedValues['en']!['tax_all']!;

  String get taxSelected =>
      _localizedValues[localeCode]!['tax_selected'] ??
      _localizedValues['en']!['tax_selected']!;

  String get reducedRate =>
      _localizedValues[localeCode]!['reduced_rate'] ??
      _localizedValues['en']!['reduced_rate']!;

  String get physicalGoods =>
      _localizedValues[localeCode]!['physical_goods'] ??
      _localizedValues['en']!['physical_goods']!;

  String get digitalProducts =>
      _localizedValues[localeCode]!['digital_products'] ??
      _localizedValues['en']!['digital_products']!;

  String get services =>
      _localizedValues[localeCode]!['services'] ??
      _localizedValues['en']!['services']!;

  String get shipping =>
      _localizedValues[localeCode]!['shipping'] ??
      _localizedValues['en']!['shipping']!;

  String get taxExempt =>
      _localizedValues[localeCode]!['tax_exempt'] ??
      _localizedValues['en']!['tax_exempt']!;

  String get taxCategory =>
      _localizedValues[localeCode]!['tax_category'] ??
      _localizedValues['en']!['tax_category']!;

  String get paymentManual =>
      _localizedValues[localeCode]!['payment_manual'] ??
      _localizedValues['en']!['payment_manual']!;

  String get setTaxCategory =>
      _localizedValues[localeCode]!['set_tax_category'] ??
      _localizedValues['en']!['set_tax_category']!;

  String get updatedTaxCategory =>
      _localizedValues[localeCode]!['updated_tax_category'] ??
      _localizedValues['en']!['updated_tax_category']!;

  String get updatedTaxCategories =>
      _localizedValues[localeCode]!['updated_tax_categories'] ??
      _localizedValues['en']!['updated_tax_categories']!;

  String get reducedTax =>
      _localizedValues[localeCode]!['reduced_tax'] ??
      _localizedValues['en']!['reduced_tax']!;

  String get overrideTax =>
      _localizedValues[localeCode]!['override_tax'] ??
      _localizedValues['en']!['override_tax']!;

  String get zeroRated =>
      _localizedValues[localeCode]!['zero_rated'] ??
      _localizedValues['en']!['zero_rated']!;

  String get reverseTax =>
      _localizedValues[localeCode]!['reverse_tax'] ??
      _localizedValues['en']!['reverse_tax']!;

  String get enableEInvoice =>
      _localizedValues[localeCode]!['enable_e_invoice'] ??
      _localizedValues['en']!['enable_e_invoice']!;

  String get eInvoiceType =>
      _localizedValues[localeCode]!['e_invoice_type'] ??
      _localizedValues['en']!['e_invoice_type']!;

  String get routingId =>
      _localizedValues[localeCode]!['routing_id'] ??
      _localizedValues['en']!['routing_id']!;

  String get lightDarkMode =>
      _localizedValues[localeCode]!['light_dark_mode'] ??
      _localizedValues['en']!['light_dark_mode']!;

  String get rename =>
      _localizedValues[localeCode]!['rename'] ??
      _localizedValues['en']!['rename']!;

  String get renamedDocument =>
      _localizedValues[localeCode]!['renamed_document'] ??
      _localizedValues['en']!['renamed_document']!;

  String get certificatePassphrase =>
      _localizedValues[localeCode]!['certificate_passphrase'] ??
      _localizedValues['en']!['certificate_passphrase']!;

  String get uploadCertificate =>
      _localizedValues[localeCode]!['upload_certificate'] ??
      _localizedValues['en']!['upload_certificate']!;

  String get certificateSet =>
      _localizedValues[localeCode]!['certificate_set'] ??
      _localizedValues['en']!['certificate_set']!;

  String get certificateNotSet =>
      _localizedValues[localeCode]!['certificate_not_set'] ??
      _localizedValues['en']!['certificate_not_set']!;

  String get passphraseSet =>
      _localizedValues[localeCode]!['passphrase_set'] ??
      _localizedValues['en']!['passphrase_set']!;

  String get passphraseNotSet =>
      _localizedValues[localeCode]!['passphrase_not_set'] ??
      _localizedValues['en']!['passphrase_not_set']!;

  String get uploadedCertificate =>
      _localizedValues[localeCode]!['uploaded_certificate'] ??
      _localizedValues['en']!['uploaded_certificate']!;

  String get nextSendTime =>
      _localizedValues[localeCode]!['next_send_time'] ??
      _localizedValues['en']!['next_send_time']!;

  String get invoiceTaskItemDescription =>
      _localizedValues[localeCode]!['invoice_task_item_description'] ??
      _localizedValues['en']!['invoice_task_item_description']!;

  String get invoiceTaskItemDescriptionHelp =>
      _localizedValues[localeCode]!['invoice_task_item_description_help'] ??
      _localizedValues['en']!['invoice_task_item_description_help']!;

  String get projectLocation =>
      _localizedValues[localeCode]!['project_location'] ??
      _localizedValues['en']!['project_location']!;

  String get emailCountInvoices =>
      _localizedValues[localeCode]!['email_count_invoices'] ??
      _localizedValues['en']!['email_count_invoices']!;

  String get gallery =>
      _localizedValues[localeCode]!['gallery'] ??
      _localizedValues['en']!['gallery']!;

  String get files =>
      _localizedValues[localeCode]!['files'] ??
      _localizedValues['en']!['files']!;

  String get camera =>
      _localizedValues[localeCode]!['camera'] ??
      _localizedValues['en']!['camera']!;

  String get creditItem =>
      _localizedValues[localeCode]!['credit_item'] ??
      _localizedValues['en']!['credit_item']!;

  String get showTaskBillable =>
      _localizedValues[localeCode]!['show_task_billable'] ??
      _localizedValues['en']!['show_task_billable']!;

  String get useMobileToManagePlan =>
      _localizedValues[localeCode]!['use_mobile_to_manage_plan'] ??
      _localizedValues['en']!['use_mobile_to_manage_plan']!;

  String get adminInitiatedPayments =>
      _localizedValues[localeCode]!['admin_initiated_payments'] ??
      _localizedValues['en']!['admin_initiated_payments']!;

  String get adminInitiatedPaymentsHelp =>
      _localizedValues[localeCode]!['admin_initiated_payments_help'] ??
      _localizedValues['en']!['admin_initiated_payments_help']!;

  String get defaultPaymentType =>
      _localizedValues[localeCode]!['default_payment_type'] ??
      _localizedValues['en']!['default_payment_type']!;

  String get taxDetails =>
      _localizedValues[localeCode]!['tax_details'] ??
      _localizedValues['en']!['tax_details']!;

  String get county =>
      _localizedValues[localeCode]!['county'] ??
      _localizedValues['en']!['county']!;

  String get region =>
      _localizedValues[localeCode]!['region'] ??
      _localizedValues['en']!['region']!;

  String get district =>
      _localizedValues[localeCode]!['district'] ??
      _localizedValues['en']!['district']!;

  String get isTaxExempt =>
      _localizedValues[localeCode]!['is_tax_exempt'] ??
      _localizedValues['en']!['is_tax_exempt']!;

  String get viewDashboardPermission =>
      _localizedValues[localeCode]!['view_dashboard_permission'] ??
      _localizedValues['en']!['view_dashboard_permission']!;

  String get unlink =>
      _localizedValues[localeCode]!['unlink'] ??
      _localizedValues['en']!['unlink']!;

  String get unlinkedTransactions =>
      _localizedValues[localeCode]!['unlinked_transactions'] ??
      _localizedValues['en']!['unlinked_transactions']!;

  String get unlinkedTransaction =>
      _localizedValues[localeCode]!['unlinked_transaction'] ??
      _localizedValues['en']!['unlinked_transaction']!;

  String get fileSavedInPath =>
      _localizedValues[localeCode]!['file_saved_in_path'] ??
      _localizedValues['en']!['file_saved_in_path']!;

  String get linkedTo =>
      _localizedValues[localeCode]!['linked_to'] ??
      _localizedValues['en']!['linked_to']!;

  String get public =>
      _localizedValues[localeCode]!['public'] ??
      _localizedValues['en']!['public']!;

  String get private =>
      _localizedValues[localeCode]!['private'] ??
      _localizedValues['en']!['private']!;

  String get image =>
      _localizedValues[localeCode]!['image'] ??
      _localizedValues['en']!['image']!;

  String get other =>
      _localizedValues[localeCode]!['other'] ??
      _localizedValues['en']!['other']!;

  String get clickOrDropFilesHere =>
      _localizedValues[localeCode]!['click_or_drop_files_here'] ??
      _localizedValues['en']!['click_or_drop_files_here']!;

  String get classification =>
      _localizedValues[localeCode]!['classification'] ??
      _localizedValues['en']!['classification']!;

  String get individual =>
      _localizedValues[localeCode]!['individual'] ??
      _localizedValues['en']!['individual']!;

  String get partnership =>
      _localizedValues[localeCode]!['partnership'] ??
      _localizedValues['en']!['partnership']!;

  String get trust =>
      _localizedValues[localeCode]!['trust'] ??
      _localizedValues['en']!['trust']!;

  String get charity =>
      _localizedValues[localeCode]!['charity'] ??
      _localizedValues['en']!['charity']!;

  String get government =>
      _localizedValues[localeCode]!['government'] ??
      _localizedValues['en']!['government']!;

  String get cacheData =>
      _localizedValues[localeCode]!['cache_data'] ??
      _localizedValues['en']!['cache_data']!;

  String get ziptaxHelp =>
      _localizedValues[localeCode]!['ziptax_help'] ??
      _localizedValues['en']!['ziptax_help']!;

  String get recurring =>
      _localizedValues[localeCode]!['recurring'] ??
      _localizedValues['en']!['recurring']!;

  String get clientContact =>
      _localizedValues[localeCode]!['client_contact'] ??
      _localizedValues['en']!['client_contact']!;

  String get userLoggedInNotification =>
      _localizedValues[localeCode]!['user_logged_in_notification'] ??
      _localizedValues['en']!['user_logged_in_notification']!;

  String get userLoggedInNotificationHelp =>
      _localizedValues[localeCode]!['user_logged_in_notification_help'] ??
      _localizedValues['en']!['user_logged_in_notification_help']!;

  String get downloadsFolderDoesNotExist =>
      _localizedValues[localeCode]!['downloads_folder_does_not_exist'] ??
      _localizedValues['en']!['downloads_folder_does_not_exist']!;

  String get totalInvoicedQuotes =>
      _localizedValues[localeCode]!['total_invoiced_quotes'] ??
      _localizedValues['en']!['total_invoiced_quotes']!;

  String get totalInvoicePaidQuotes =>
      _localizedValues[localeCode]!['total_invoice_paid_quotes'] ??
      _localizedValues['en']!['total_invoice_paid_quotes']!;

  String get downloadsFolder =>
      _localizedValues[localeCode]!['downloads_folder'] ??
      _localizedValues['en']!['downloads_folder']!;

  String get saveFilesToThisFolder =>
      _localizedValues[localeCode]!['save_files_to_this_folder'] ??
      _localizedValues['en']!['save_files_to_this_folder']!;

  String get lastLogin =>
      _localizedValues[localeCode]!['last_login'] ??
      _localizedValues['en']!['last_login']!;

  String get recordState =>
      _localizedValues[localeCode]!['record_state'] ??
      _localizedValues['en']!['record_state']!;

  String get taskItem =>
      _localizedValues[localeCode]!['task_item'] ??
      _localizedValues['en']!['task_item']!;

  String get quarter =>
      _localizedValues[localeCode]!['quarter'] ??
      _localizedValues['en']!['quarter']!;

  String get deliveryNoteDesign =>
      _localizedValues[localeCode]!['delivery_note_design'] ??
      _localizedValues['en']!['delivery_note_design']!;

  String get statementDesign =>
      _localizedValues[localeCode]!['statement_design'] ??
      _localizedValues['en']!['statement_design']!;

  String get paymentReceiptDesign =>
      _localizedValues[localeCode]!['payment_receipt_design'] ??
      _localizedValues['en']!['payment_receipt_design']!;

  String get paymentRefundDesign =>
      _localizedValues[localeCode]!['payment_refund_design'] ??
      _localizedValues['en']!['payment_refund_design']!;

  String get templateHelp =>
      _localizedValues[localeCode]!['template_help'] ??
      _localizedValues['en']!['template_help']!;

  String get reactivateEmail =>
      _localizedValues[localeCode]!['reactivate_email'] ??
      _localizedValues['en']!['reactivate_email']!;

  String get emailReactivated =>
      _localizedValues[localeCode]!['email_reactivated'] ??
      _localizedValues['en']!['email_reactivated']!;

  String get taskExtensionBanner =>
      _localizedValues[localeCode]!['task_extension_banner'] ??
      _localizedValues['en']!['task_extension_banner']!;

  String get watchVideo =>
      _localizedValues[localeCode]!['watch_video'] ??
      _localizedValues['en']!['watch_video']!;

  String get viewExtension =>
      _localizedValues[localeCode]!['view_extension'] ??
      _localizedValues['en']!['view_extension']!;

  String get runTemplate =>
      _localizedValues[localeCode]!['run_template'] ??
      _localizedValues['en']!['run_template']!;

  String get insertBelow =>
      _localizedValues[localeCode]!['insert_below'] ??
      _localizedValues['en']!['insert_below']!;

  String get primaryContact =>
      _localizedValues[localeCode]!['primary_contact'] ??
      _localizedValues['en']!['primary_contact']!;

  String get allContacts =>
      _localizedValues[localeCode]!['all_contacts'] ??
      _localizedValues['en']!['all_contacts']!;

  String get sendEmailsTo =>
      _localizedValues[localeCode]!['send_emails_to'] ??
      _localizedValues['en']!['send_emails_to']!;

  String get selectProvider =>
      _localizedValues[localeCode]!['select_provider'] ??
      _localizedValues['en']!['select_provider']!;

  String get yodleeRegions =>
      _localizedValues[localeCode]!['yodlee_regions'] ??
      _localizedValues['en']!['yodlee_regions']!;

  String get nordigenRegions =>
      _localizedValues[localeCode]!['nordigen_regions'] ??
      _localizedValues['en']!['nordigen_regions']!;

  String get participant =>
      _localizedValues[localeCode]!['participant'] ??
      _localizedValues['en']!['participant']!;

  String get participantName =>
      _localizedValues[localeCode]!['participant_name'] ??
      _localizedValues['en']!['participant_name']!;

  String get nordigenHelp =>
      _localizedValues[localeCode]!['nordigen_help'] ??
      _localizedValues['en']!['nordigen_help']!;

  String get host =>
      _localizedValues[localeCode]!['host'] ?? _localizedValues['en']!['host']!;

  String get port =>
      _localizedValues[localeCode]!['port'] ?? _localizedValues['en']!['port']!;

  String get encryption =>
      _localizedValues[localeCode]!['encryption'] ??
      _localizedValues['en']!['encryption']!;

  String get localDomain =>
      _localizedValues[localeCode]!['local_domain'] ??
      _localizedValues['en']!['local_domain']!;

  String get verifyPeer =>
      _localizedValues[localeCode]!['verify_peer'] ??
      _localizedValues['en']!['verify_peer']!;

  String get username =>
      _localizedValues[localeCode]!['username'] ??
      _localizedValues['en']!['username']!;

  String get emailReport =>
      _localizedValues[localeCode]!['email_report'] ??
      _localizedValues['en']!['email_report']!;

  String get mobileVersion =>
      _localizedValues[localeCode]!['mobile_version'] ??
      _localizedValues['en']!['mobile_version']!;

  String get pleaseSelectAnInvoiceOrCredit =>
      _localizedValues[localeCode]!['please_select_an_invoice_or_credit'] ??
      _localizedValues['en']!['please_select_an_invoice_or_credit']!;

  String get sendTestEmail =>
      _localizedValues[localeCode]!['send_test_email'] ??
      _localizedValues['en']!['send_test_email']!;

  String get testEmailSent =>
      _localizedValues[localeCode]!['test_email_sent'] ??
      _localizedValues['en']!['test_email_sent']!;

  String get useAvailablePayments =>
      _localizedValues[localeCode]!['use_available_payments'] ??
      _localizedValues['en']!['use_available_payments']!;

  String get validVatNumber =>
      _localizedValues[localeCode]!['valid_vat_number'] ??
      _localizedValues['en']!['valid_vat_number']!;

  String get eQuoteType =>
      _localizedValues[localeCode]!['e_quote_type'] ??
      _localizedValues['en']!['e_quote_type']!;

  String get checkCredentials =>
      _localizedValues[localeCode]!['check_credentials'] ??
      _localizedValues['en']!['check_credentials']!;

  String get validCredentials =>
      _localizedValues[localeCode]!['valid_credentials'] ??
      _localizedValues['en']!['valid_credentials']!;

  String get invalidCredentials =>
      _localizedValues[localeCode]!['invalid_credentials'] ??
      _localizedValues['en']!['invalid_credentials']!;

  String get rappenRounding =>
      _localizedValues[localeCode]!['rappen_rounding'] ??
      _localizedValues['en']!['rappen_rounding']!;

  String get rappenRoundingHelp =>
      _localizedValues[localeCode]!['rappen_rounding_help'] ??
      _localizedValues['en']!['rappen_rounding_help']!;

  String get flutterWebWarning =>
      _localizedValues[localeCode]!['flutter_web_warning'] ??
      _localizedValues['en']!['flutter_web_warning']!;

  String get alwaysShowRequiredFields =>
      _localizedValues[localeCode]!['always_show_required_fields'] ??
      _localizedValues['en']!['always_show_required_fields']!;

  String get alwaysShowRequiredFieldsHelp =>
      _localizedValues[localeCode]!['always_show_required_fields_help'] ??
      _localizedValues['en']!['always_show_required_fields_help']!;

  String get advancedCards =>
      _localizedValues[localeCode]!['advanced_cards'] ??
      _localizedValues['en']!['advanced_cards']!;

  String get bulkUpdate =>
      _localizedValues[localeCode]!['bulk_update'] ??
      _localizedValues['en']!['bulk_update']!;

  String get bulkUpdated =>
      _localizedValues[localeCode]!['bulk_updated'] ??
      _localizedValues['en']!['bulk_updated']!;

  String get roundTasks =>
      _localizedValues[localeCode]!['round_tasks'] ??
      _localizedValues['en']!['round_tasks']!;

  String get roundTasksHelp =>
      _localizedValues[localeCode]!['round_tasks_help'] ??
      _localizedValues['en']!['round_tasks_help']!;

  String get direction =>
      _localizedValues[localeCode]!['direction'] ??
      _localizedValues['en']!['direction']!;

  String get roundUp =>
      _localizedValues[localeCode]!['round_up'] ??
      _localizedValues['en']!['round_up']!;

  String get roundDown =>
      _localizedValues[localeCode]!['round_down'] ??
      _localizedValues['en']!['round_down']!;

  String get taskRoundToNearest =>
      _localizedValues[localeCode]!['task_round_to_nearest'] ??
      _localizedValues['en']!['task_round_to_nearest']!;

  String get roundToSeconds =>
      _localizedValues[localeCode]!['round_to_seconds'] ??
      _localizedValues['en']!['round_to_seconds']!;

  String get webApp =>
      _localizedValues[localeCode]!['web_app'] ??
      _localizedValues['en']!['web_app']!;

  String get desktopApp =>
      _localizedValues[localeCode]!['desktop_app'] ??
      _localizedValues['en']!['desktop_app']!;

  String get calculate =>
      _localizedValues[localeCode]!['calculate'] ??
      _localizedValues['en']!['calculate']!;

  String get sum =>
      _localizedValues[localeCode]!['sum'] ?? _localizedValues['en']!['sum']!;

  String get format =>
      _localizedValues[localeCode]!['format'] ??
      _localizedValues['en']!['format']!;

  String get money =>
      _localizedValues[localeCode]!['money'] ??
      _localizedValues['en']!['money']!;

  String get time =>
      _localizedValues[localeCode]!['time'] ?? _localizedValues['en']!['time']!;

  String get reconnect =>
      _localizedValues[localeCode]!['reconnect'] ??
      _localizedValues['en']!['reconnect']!;

  String get disconnected =>
      _localizedValues[localeCode]!['disconnected'] ??
      _localizedValues['en']!['disconnected']!;

  String get addComment =>
      _localizedValues[localeCode]!['add_comment'] ??
      _localizedValues['en']!['add_comment']!;

  String get comment =>
      _localizedValues[localeCode]!['comment'] ??
      _localizedValues['en']!['comment']!;

  String get addedComment =>
      _localizedValues[localeCode]!['added_comment'] ??
      _localizedValues['en']!['added_comment']!;

  String get referralProgram =>
      _localizedValues[localeCode]!['referral_program'] ??
      _localizedValues['en']!['referral_program']!;

  String get referralUrl =>
      _localizedValues[localeCode]!['referral_url'] ??
      _localizedValues['en']!['referral_url']!;

  String get invoicesLockedEndOfMonth =>
      _localizedValues[localeCode]!['invoices_locked_end_of_month'] ??
      _localizedValues['en']!['invoices_locked_end_of_month']!;

  String get taskAssignedNotification =>
      _localizedValues[localeCode]!['task_assigned_notification'] ??
      _localizedValues['en']!['task_assigned_notification']!;

  String get taskAssignedNotificationHelp =>
      _localizedValues[localeCode]!['task_assigned_notification_help'] ??
      _localizedValues['en']!['task_assigned_notification_help']!;

  String get beforeValidUntil =>
      _localizedValues[localeCode]!['before_valid_until'] ??
      _localizedValues['en']!['before_valid_until']!;

  String get afterValidUntil =>
      _localizedValues[localeCode]!['after_valid_until'] ??
      _localizedValues['en']!['after_valid_until']!;

  String get afterQuoteDate =>
      _localizedValues[localeCode]!['after_quote_date'] ??
      _localizedValues['en']!['after_quote_date']!;

  String get latestRequiresPhpVersion =>
      _localizedValues[localeCode]!['latest_requires_php_version'] ??
      _localizedValues['en']!['latest_requires_php_version']!;

  String get emails =>
      _localizedValues[localeCode]!['emails'] ??
      _localizedValues['en']!['emails']!;

  String get mergeToPdf =>
      _localizedValues[localeCode]!['merge_to_pdf'] ??
      _localizedValues['en']!['merge_to_pdf']!;

  String get assignGroup =>
      _localizedValues[localeCode]!['assign_group'] ??
      _localizedValues['en']!['assign_group']!;

  String get assignedGroup =>
      _localizedValues[localeCode]!['assigned_group'] ??
      _localizedValues['en']!['assigned_group']!;

  String get appliesTo =>
      _localizedValues[localeCode]!['applies_to'] ??
      _localizedValues['en']!['applies_to']!;

  String get onePageCheckout =>
      _localizedValues[localeCode]!['one_page_checkout'] ??
      _localizedValues['en']!['one_page_checkout']!;

  String get onePageCheckoutHelp =>
      _localizedValues[localeCode]!['one_page_checkout_help'] ??
      _localizedValues['en']!['one_page_checkout_help']!;

  String get acceptPurchaseOrder =>
      _localizedValues[localeCode]!['accept_purchase_order'] ??
      _localizedValues['en']!['accept_purchase_order']!;

  String get showPdfhtmlMobileHelp =>
      _localizedValues[localeCode]!['show_pdfhtml_on_mobile_help'] ??
      _localizedValues['en']!['show_pdfhtml_on_mobile_help']!;

  String get uploadLogoShort =>
      _localizedValues[localeCode]!['upload_logo_short'] ??
      _localizedValues['en']!['upload_logo_short']!;

  String get sslHostOverride =>
      _localizedValues[localeCode]!['ssl_host_override'] ??
      _localizedValues['en']!['ssl_host_override']!;

  String get mergedVendors =>
      _localizedValues[localeCode]!['merged_vendors'] ??
      _localizedValues['en']!['merged_vendors']!;

  String get enableClientProfileUpdate =>
      _localizedValues[localeCode]!['enable_client_profile_update'] ??
      _localizedValues['en']!['enable_client_profile_update']!;

  String get enableClientProfileUpdateHelp =>
      _localizedValues[localeCode]!['enable_client_profile_update_help'] ??
      _localizedValues['en']!['enable_client_profile_update_help']!;

  String get sendEmails =>
      _localizedValues[localeCode]!['send_emails'] ??
      _localizedValues['en']!['send_emails']!;

  String get sendEmailsPermission =>
      _localizedValues[localeCode]!['send_emails_permission'] ??
      _localizedValues['en']!['send_emails_permission']!;

  String get preferenceProductNotesForHtmlView =>
      _localizedValues[localeCode]!['preference_product_notes_for_html_view'] ??
      _localizedValues['en']!['preference_product_notes_for_html_view']!;

  String get preferenceProductNotesForHtmlViewHelp =>
      _localizedValues[localeCode]![
          'preference_product_notes_for_html_view_help'] ??
      _localizedValues['en']!['preference_product_notes_for_html_view_help']!;

  String get locations =>
      _localizedValues[localeCode]!['locations'] ??
      _localizedValues['en']!['locations']!;

  String get location =>
      _localizedValues[localeCode]!['location'] ??
      _localizedValues['en']!['location']!;

  String get addLocation =>
      _localizedValues[localeCode]!['add_location'] ??
      _localizedValues['en']!['add_location']!;

  String get editLocation =>
      _localizedValues[localeCode]!['edit_location'] ??
      _localizedValues['en']!['edit_location']!;

  String get addedLocation =>
      _localizedValues[localeCode]!['added_location'] ??
      _localizedValues['en']!['added_location']!;

  String get updatedLocation =>
      _localizedValues[localeCode]!['updated_location'] ??
      _localizedValues['en']!['updated_location']!;

  String get deletedLocation =>
      _localizedValues[localeCode]!['deleted_location'] ??
      _localizedValues['en']!['deleted_location']!;

  String get isShipping =>
      _localizedValues[localeCode]!['is_shipping'] ??
      _localizedValues['en']!['is_shipping']!;

  String get replaced =>
      _localizedValues[localeCode]!['replaced'] ??
      _localizedValues['en']!['replaced']!;

  String get secretKey =>
      _localizedValues[localeCode]!['secret_key'] ??
      _localizedValues['en']!['secret_key']!;

  String get accessKey =>
      _localizedValues[localeCode]!['access_key'] ??
      _localizedValues['en']!['access_key']!;

  String get fromAddress =>
      _localizedValues[localeCode]!['from_address'] ??
      _localizedValues['en']!['from_address']!;

  String get topicArn =>
      _localizedValues[localeCode]!['topic_arn'] ??
      _localizedValues['en']!['topic_arn']!;

  String get empty =>
      _localizedValues[localeCode]!['empty'] ??
      _localizedValues['en']!['empty']!;

  String get eInvoiceReceivedNotification =>
      _localizedValues[localeCode]!['e_invoice_received_notification'] ??
      _localizedValues['en']!['e_invoice_received_notification']!;

  String get eInvoiceReceivedNotificationHelp =>
      _localizedValues[localeCode]!['e_invoice_received_notification_help'] ??
      _localizedValues['en']!['e_invoice_received_notification_help']!;

  String get disableRecurringPaymentNotification =>
      _localizedValues[localeCode]!['disable_recurring_payment_notification'] ??
      _localizedValues['en']!['disable_recurring_payment_notification']!;

  String get disableRecurringPaymentNotificationHelp =>
      _localizedValues[localeCode]![
          'disable_recurring_payment_notification_help'] ??
      _localizedValues['en']!['disable_recurring_payment_notification_help']!;

  String get rejected =>
      _localizedValues[localeCode]!['rejected'] ??
      _localizedValues['en']!['rejected']!;

  String get ccOnly =>
      _localizedValues[localeCode]!['cc_only'] ??
      _localizedValues['en']!['cc_only']!;

  String get forwardEmail =>
      _localizedValues[localeCode]!['forward_email'] ??
      _localizedValues['en']!['forward_email']!;

  String get eInvoiceSettings =>
      _localizedValues[localeCode]!['e_invoice_settings'] ??
      _localizedValues['en']!['e_invoice_settings']!;

  String get skipAutomaticEmails =>
      _localizedValues[localeCode]!['skip_automatic_emails'] ??
      _localizedValues['en']!['skip_automatic_emails']!;

  String get eInvoice =>
      _localizedValues[localeCode]!['e_invoice'] ??
      _localizedValues['en']!['e_invoice']!;

  String get actualDeliveryDate =>
      _localizedValues[localeCode]!['actual_delivery_date'] ??
      _localizedValues['en']!['actual_delivery_date']!;

  String get actAsSender =>
      _localizedValues[localeCode]!['act_as_sender'] ??
      _localizedValues['en']!['act_as_sender']!;

  String get actAsReceiver =>
      _localizedValues[localeCode]!['act_as_receiver'] ??
      _localizedValues['en']!['act_as_receiver']!;

  String get paymentMeans =>
      _localizedValues[localeCode]!['payment_means'] ??
      _localizedValues['en']!['payment_means']!;

  String get accountHolder =>
      _localizedValues[localeCode]!['account_holder'] ??
      _localizedValues['en']!['account_holder']!;

  // STARTER: lang field - do not remove comment

  String lookup(String? key, {String? overrideLocaleCode}) {
    final lookupKey = toSnakeCase(key);

    if ((key ?? '').isEmpty) {
      return '';
    }

    if (lookupKey.startsWith('_')) {
      return key ?? '';
    }

    final values =
        _localizedValues[(overrideLocaleCode ?? localeCode).split('_').first] ??
            _localizedValues['en']!;
    final value = values[lookupKey] ??
        _localizedValues[localeCode]![lookupKey.replaceFirst('_id', '')] ??
        '';

    if (value.isEmpty) {
      print('## ERROR: localization key not found - $key');

      final englishValue = _localizedValues['en']![lookupKey] ?? '';

      return englishValue.isEmpty ? (key ?? '') : englishValue;
    }

    return value;
  }
}
