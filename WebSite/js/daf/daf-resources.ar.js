
/*!
* Data Aquarium Framework - Resources
* Copyright 2008-2017 Code On Time LLC; Licensed MIT; http://codeontime.com/license
*/
(function () {
    Type.registerNamespace('Web');

    var _dvr = Web.DataViewResources = {};

    _dvr.Common = {
        WaitHtml: '<div class="Wait"></div>'
    };

    _dvr.Pager = {
        ItemsPerPage: 'البنود في الصفحة :',
        PageSizes: [10, 15, 20, 25],
        ShowingItems: 'عرض \u003cb\u003e{0}\u003c/b\u003e - \u003cb\u003e{1}\u003c/b\u003e البنود \u003cb\u003e{2}\u003c/b\u003e',
        SelectionInfo: ' (<b>{0}</b> selected)',
        Refresh: 'التحديث',
        Next: 'التالي »',
        Previous: '« سابق',
        Page: 'صفحة',
        PageButtonCount: 10
    };

    _dvr.ActionBar = {
        View: 'رأي'
    };

    _dvr.ModalPopup = {
        Close: 'قريب',
        MaxWidth: 800,
        MaxHeight: 600,
        OkButton: 'موافق',
        CancelButton: 'إلغاء',
        SaveButton: 'حفظ',
        SaveAndNewButton: 'حفظ وجديد'
    };

    _dvr.Menu = {
        SiteActions: 'موقع تطبيقات',
        SeeAlso: 'انظر أيضا',
        Summary: 'ملخص',
        Tasks: 'المهام',
        About: 'حول'
    };

    _dvr.HeaderFilter = {
        GenericSortAscending: 'أصغر في الأعلى',
        GenericSortDescending: 'الأكبر في الأعلى',
        StringSortAscending: 'تصاعدي',
        StringSortDescending: 'تنازلي',
        DateSortAscending: 'على أقرب الأعلى',
        DateSortDescending: 'آخر يوم الأعلى',
        EmptyValue: '(فارغ)',
        BlankValue: '(فارغ)',
        Loading: 'تحميل...',
        ClearFilter: 'تصفية واضحة من {0}',
        SortBy: 'المرتبة حسب {0}',
        MaxSampleTextLen: 80,
        CustomFilterOption: 'تصفية...'
    };

    _dvr.InfoBar = {
        FilterApplied: 'وقد طبق التصفية.',
        ValueIs: ' <span class="Highlight">{0}</span> ',
        Or: ' أو ',
        And: ' و ',
        EqualTo: 'يساوي ',
        LessThan: 'أقل من ',
        LessThanOrEqual: 'أقل من أو يساوي ',
        GreaterThan: 'أكبر من ',
        GreaterThanOrEqual: 'أكبر من أو يساوي ',
        Like: 'مثل ',
        StartsWith: 'يبدأ ',
        Empty: 'فارغ',
        QuickFind: ' أي حقل يحتوي '
    };

    _dvr.Lookup = {
        SelectToolTip: 'حدد {0}',
        ClearToolTip: 'واضح {0}',
        NewToolTip: '{0} جديدة',
        SelectLink: '(تحديد)',
        ShowActionBar: true,
        DetailsToolTip: 'عرض تفاصيل عن {0}',
        ShowDetailsInPopup: true,
        GenericNewToolTip: 'خلق فرص عمل جديدة',
        AddItem: 'اضافة عنصر'
    };

    _dvr.Validator = {
        Required: 'مطلوب',
        RequiredField: 'هذا الحقل مطلوب.',
        EnforceRequiredFieldsWithDefaultValue: false,
        NumberIsExpected: 'ومن المتوقع ان العدد.',
        BooleanIsExpected: 'ومن المتوقع ان قيمة منطقية.',
        DateIsExpected: 'ومن المتوقع تحديد موعد.',
        Optional: 'اختياري'
    };

    var _mn = Sys.CultureInfo.CurrentCulture.dateTimeFormat.MonthNames;

    _dvr.Data = {
        ConnectionLost: 'تم فقدان الاتصال بالشبكة. المحاولة مرة أخرى؟',
        AnyValue: '(أي)',
        NullValue: '<span class="NA">ن / أ</span>',
        NullValueInForms: 'N / A',
        BooleanDefaultStyle: 'DropDownList',
        BooleanOptionalDefaultItems: [[null, 'N / A'], [false, 'لا'], [true, 'نعم']],
        BooleanDefaultItems: [[false, 'لا'], [true, 'نعم']],
        MaxReadOnlyStringLen: 600,
        NoRecords: 'العثور على أية سجلات.',
        BlobHandler: 'Blob.ashx',
        BlobDownloadLink: 'تحميل',
        BlobDownloadLinkReadOnly: '<span style="color:gray;">تحميل</span>',
        BlobDownloadHint: 'انقر هنا لتحميل الملف الأصلي.',
        BatchUpdate: 'التحديث',
        NoteEditLabel: 'تحرير',
        NoteDeleteLabel: 'حذف',
        NoteDeleteConfirm: 'حذف؟',
        UseLEV: 'لصق \u0026quot;{0}\u0026quot;',
        DiscardChanges: 'تجاهل التغييرات؟',
        Import: {
            UploadInstruction: 'الرجاء اختيار ملف للتحميل. يجب أن يكون الملف في تنسيق \u003cb\u003eCSV\u003c/b\u003e \u003cb\u003eXLS\u003c/b\u003e ، أو \u003cb\u003eXLSX\u003c/b\u003e.',
            DownloadTemplate: 'تحميل ملف استيراد القالب.',
            Uploading: 'يتم تحميله ملف إلى الخادم. يرجى الانتظار...',
            MappingInstruction: 'هناك سجل \u003cb\u003e{0}\u003c/b\u003e (s) في ملف \u003cb\u003e{1}\u003c/b\u003e جاهزة للprocessed.\u003cbr/\u003ePlease خريطة حقول الاستيراد من ملف البيانات إلى حقول التطبيق وفوق \u003ci\u003eImport\u003c/i\u003e لبدء المعالجة.',
            StartButton: 'استيراد',
            AutoDetect: '(الكشف عن السيارات)',
            Processing: 'وقد بدأت معالجة ملف الاستيراد. سوف تصبح مستوردة سجلات البيانات المتاحة عند معالجة ناجحة. قد تحتاج لتحديث الآراء ذات الصلة / صفحات لمشاهدة السجلات المستوردة.',
            Email: 'إرسال السجل الاستيراد إلى عناوين البريد الإلكتروني التالي (اختياري)',
            EmailNotSpecified: 'لم يكن المستفيد من سجل الاستيراد المحدد. المتابعة على أية حال؟'
        },
        Filters: {
            Labels: {
                And: 'و',
                Or: 'أو',
                Equals: 'يساوي',
                Clear: 'واضح',
                SelectAll: '(تحديد الكل)',
                Includes: 'ويشمل',
                FilterToolTip: 'تغيير'
            },
            Number: {
                Text: 'عدد المرشحات',
                Kind: 'عدد',
                List: [
                    { Function: '=', Text: 'يساوي', Prompt: true },
                    { Function: '<>', Text: 'لا تكافؤ', Prompt: true },
                    { Function: '<', Text: 'أقل من', Prompt: true },
                    { Function: '>', Text: 'أكبر من', Prompt: true },
                    { Function: '<=', Text: 'أقل من أو يساوي', Prompt: true },
                    { Function: '>=', Text: 'أكبر من أو يساوي', Prompt: true },
                    { Function: '$between', Text: 'بين', Prompt: true },
                    { Function: '$in', Text: 'ويشمل', Prompt: true, Hidden: true },
                    { Function: '$notin', Text: 'لا تتضمن', Prompt: true, Hidden: true },
                    { Function: '$isnotempty', Text: 'ليس فارغا' },
                    { Function: '$isempty', Text: 'فارغ' }
                ]
            },
            Text: {
                Text: 'النص مرشحات',
                Kind: 'نص',
                List: [
                    { Function: '=', Text: 'يساوي', Prompt: true },
                    { Function: '<>', Text: 'لا تكافؤ', Prompt: true },
                    { Function: '$beginswith', Text: 'يبدأ', Prompt: true },
                    { Function: '$doesnotbeginwith', Text: 'لا يبدأ ب', Prompt: true },
                    { Function: '$contains', Text: 'يحتوي', Prompt: true },
                    { Function: '$doesnotcontain', Text: 'لا يحتوي', Prompt: true },
                    { Function: '$endswith', Text: 'ينتهي', Prompt: true },
                    { Function: '$doesnotendwith', Text: 'لا تنتهي', Prompt: true },
                    { Function: '$in', Text: 'ويشمل', Prompt: true, Hidden: true },
                    { Function: '$notin', Text: 'لا تتضمن', Prompt: true, Hidden: true },
                    { Function: '$isnotempty', Text: 'ليس فارغا' },
                    { Function: '$isempty', Text: 'فارغ' }
                ]
            },
            Boolean: {
                Text: 'مرشحات منطقية',
                Kind: 'منطقي',
                List: [
                    { Function: '$true', Text: 'نعم' },
                    { Function: '$false', Text: 'لا' },
                    { Function: '$isnotempty', Text: 'ليس فارغا' },
                    { Function: '$isempty', Text: 'فارغ' }
                ]
            },
            Date: {
                Text: 'تاريخ مرشحات',
                Kind: 'تاريخ',
                List: [
                    { Function: '=', Text: 'يساوي', Prompt: true },
                    { Function: '<>', Text: 'لا تكافؤ', Prompt: true },
                    { Function: '<', Text: 'قبل', Prompt: true },
                    { Function: '>', Text: 'بعد', Prompt: true },
                    { Function: '<=', Text: 'في أو قبل', Prompt: true },
                    { Function: '>=', Text: 'في أو بعد', Prompt: true },
                    { Function: '$between', Text: 'بين', Prompt: true },
                    { Function: '$in', Text: 'ويشمل', Prompt: true, Hidden: true },
                    { Function: '$notin', Text: 'لا تتضمن', Prompt: true, Hidden: true },
                    { Function: '$isnotempty', Text: 'ليس فارغا' },
                    { Function: '$isempty', Text: 'فارغ' },
                    null,
                    { Function: '$tomorrow', Text: 'غدا' },
                    { Function: '$today', Text: 'اليوم' },
                    { Function: '$yesterday', Text: 'أمس' },
                    null,
                    { Function: '$nextweek', Text: 'الأسبوع المقبل' },
                    { Function: '$thisweek', Text: 'هذا الأسبوع' },
                    { Function: '$lastweek', Text: 'الأسبوع الماضي' },
                    null,
                    { Function: '$nextmonth', Text: 'الشهر المقبل' },
                    { Function: '$thismonth', Text: 'هذا الشهر' },
                    { Function: '$lastmonth', Text: 'الشهر الماضي' },
                    null,
                    { Function: '$nextquarter', Text: 'الربع القادم' },
                    { Function: '$thisquarter', Text: 'في هذا الربع' },
                    { Function: '$lastquarter', Text: 'الربع الأخير' },
                    null,
                    { Function: '$nextyear', Text: 'العام المقبل' },
                    { Function: '$thisyear', Text: 'هذه السنة' },
                    { Function: '$yeartodate', Text: 'السنة إلى تاريخ' },
                    { Function: '$lastyear', Text: 'العام الماضي' },
                    null,
                    { Function: '$past', Text: 'الماضي' },
                    { Function: '$future', Text: 'مستقبل' },
                    null,
                    {
                        Text: 'جميع التواريخ في الفترة',
                        List: [
                            { Function: '$quarter1', Text: 'الربع 1' },
                            { Function: '$quarter2', Text: 'الربع 2' },
                            { Function: '$quarter3', Text: 'الربع 3' },
                            { Function: '$quarter4', Text: 'الربع 4' },
                            null,
                            { Function: '$month1', Text: _mn[0] },
                            { Function: '$month2', Text: _mn[1] },
                            { Function: '$month3', Text: _mn[2] },
                            { Function: '$month4', Text: _mn[3] },
                            { Function: '$month5', Text: _mn[4] },
                            { Function: '$month6', Text: _mn[5] },
                            { Function: '$month7', Text: _mn[6] },
                            { Function: '$month8', Text: _mn[7] },
                            { Function: '$month9', Text: _mn[8] },
                            { Function: '$month10', Text: _mn[9] },
                            { Function: '$month11', Text: _mn[10] },
                            { Function: '$month12', Text: _mn[11] }
                        ]
                    }
            ]
            }
        }
    };


    _dvr.Form = {
        ShowActionBar: true,
        ShowCalendarButton: true,
        RequiredFieldMarker: '<span class="Required">*</span>',
        RequiredFiledMarkerFootnote: '* - يشير إلى حقل مطلوب',
        SingleButtonRowFieldLimit: 7,
        GeneralTabText: 'عام',
        Minimize: 'انهيار',
        Maximize: 'توسيع'
    };

    _dvr.Grid = {
        InPlaceEditContextMenuEnabled: true,
        QuickFindText: 'البحث السريع',
        QuickFindToolTip: 'اكتب للبحث في السجلات واضغط Enter',
        ShowAdvancedSearch: 'تظهر بحث متقدم',
        VisibleSearchBarFields: 3,
        DeleteSearchBarField: '(حذف)',
        //AddSearchBarField: 'حقول أكثر للبحث',
        HideAdvancedSearch: 'إخفاء البحث المتقدم',
        PerformAdvancedSearch: 'بحث',
        ResetAdvancedSearch: 'إعادة تعيين',
        NewRowLink: 'انقر هنا لإنشاء سجل جديد.',
        RootNodeText: 'على مستوي عالي',
        FlatTreeToggle: 'التبديل إلى التسلسل الهرمي',
        HierarchyTreeModeToggle: 'التبديل إلى قائمة مسطح',
        AddConditionText: 'إضافة شرط البحث',
        AddCondition: 'إضافة حالة',
        RemoveCondition: 'إزالة حالة',
        ActionColumnHeaderText: 'الإجراءات',
        Aggregates: {
            None: { FmtStr: '', ToolTip: '' },
            Sum: { FmtStr: 'خلاصة القول : {0}', ToolTip: 'مجموع {0}' },
            Count: { FmtStr: 'العد : {0}', ToolTip: 'عد من {0}' },
            Avg: { FmtStr: 'التقييم : {0}', ToolTip: 'متوسط ​​{0}' },
            Max: { FmtStr: 'ماكس : {0}', ToolTip: 'الحد الأقصى ل{0}' },
            Min: { FmtStr: 'الحد الأدنى : {0}', ToolTip: 'الحد الأدنى من {0}' }
        },
        Freeze: 'تجمد',
        Unfreeze: 'تسيح'
    };

    _dvr.Views = {
        DefaultDescriptions: {
            '$DefaultGridViewDescription': 'هذه هي قائمة {0}.',
            '$DefaultEditViewDescription': 'يرجى مراجعة المعلومات الواردة أدناه {0}. انقر على تحرير لتغيير هذا السجل ، انقر فوق حذف لحذف السجل ، أو انقر فوق إلغاء / إغلاق للعودة الى الوراء.',
            '$DefaultCreateViewDescription': 'يرجى ملء هذا النموذج وانقر على زر موافق لإنشاء سجل {0} جديدة. فوق إلغاء للعودة الى الشاشة السابقة.'
        },
        DefaultCategoryDescriptions: {
            '$DefaultEditDescription': 'هذه هي حقول السجل {0} التي يمكن تحريرها.',
            '$DefaultNewDescription': 'استكمال النموذج. تأكد من إدخال جميع الحقول المطلوبة.',
            '$DefaultReferenceDescription': 'وترد تفاصيل إضافية حول {0} في قسم المعلومات المرجعية.'
        }
    };

    _dvr.Actions = {
        Scopes: {
            'Grid': {
                'Select': {
                    HeaderText: 'حدد'
                },
                'Edit': {
                    HeaderText: 'تحرير'
                },
                'Delete': {
                    HeaderText: 'حذف',
                    Confirmation: 'حذف؟',
                    Notify: 'تم حذف {$ سيلكتد}'
                },
                'Duplicate': {
                    HeaderText: 'مكررة'
                },
                'New': {
                    HeaderText: 'جديد'
                },
                'BatchEdit': {
                    HeaderText: 'الدفعة تحرير'
                    //                    ,CommandArgument: {
                    //                        'editForm1': {
                    //                            HeaderText: 'الدفعة تحرير (نموذج)'
                    //                        }
                    //                    }
                },
                'Open': {
                    HeaderText: 'فتح'
                }
            },
            'Form': {
                'Edit': {
                    HeaderText: 'تحرير'
                },
                'Delete': {
                    HeaderText: 'حذف',
                    Confirmation: 'حذف؟',
                    Notify: 'تم حذف {$ سيلكتد}'
                },
                'Cancel': {
                    HeaderText: 'قريب',
                    WhenLastCommandName: {
                        'Duplicate': {
                            HeaderText: 'إلغاء'
                        },
                        'Edit': {
                            HeaderText: 'إلغاء'
                        },
                        'New': {
                            HeaderText: 'إلغاء'
                        }

                    }
                },
                'Update': {
                    HeaderText: 'موافق',
                    Notify: 'تم الحفظ - {0}',
                    CommandArgument: {
                        'Save': {
                            HeaderText: 'حفظ',
                            Notify: 'تم الحفظ - {0}'
                        }
                    },
                    WhenLastCommandName: {
                        'BatchEdit': {
                            HeaderText: 'اختيار التحديث',
                            Confirmation: 'التحديث؟',
                            Notify: 'تم الحفظ - {0}'
                        }
                    }
                },
                'Insert': {
                    HeaderText: 'موافق',
                    Notify: 'تم الحفظ - {0}',
                    CommandArgument: {
                        'Save': {
                            HeaderText: 'حفظ',
                            Notify: 'تم الحفظ - {0}'
                        },
                        'SaveAndNew': {
                            HeaderText: 'حفظ وجديد',
                            Notify: 'تم الحفظ - {0}'
                        }
                    }
                },
                'Confirm': {
                    HeaderText: 'موافق'
                },
                'Navigate': {
                    Controller: {
                        'SiteContent': {
                            HeaderText: 'إضافة هوية النظام'
                        }
                    }
                }
            },
            'ActionBar': {
                _Self: {
                    'Actions': {
                        HeaderText: 'الإجراءات'
                    },
                    'Report': {
                        HeaderText: 'تقرير'
                    },
                    'Record': {
                        HeaderText: 'سجل'
                    }
                },
                'New': {
                    HeaderText: '{0} جديدة',
                    Description: 'إنشاء سجل {0} جديدة.',
                    HeaderText2: 'جديد',
                    VarMaxLen: 15
                },
                'Edit': {
                    HeaderText: 'تحرير'
                },
                'Delete': {
                    HeaderText: 'حذف',
                    Confirmation: 'حذف؟',
                    Notify: 'تم حذف {$ سيلكتد}'
                },
                'ExportCsv': {
                    HeaderText: 'تحميل',
                    Description: 'تنزيل عناصر في تنسيق CSV.'
                },
                'ExportRowset': {
                    HeaderText: 'تصدير إلى جدول بيانات',
                    Description: 'تحليل العناصر مع spreadsheet\u003cbr/\u003eapplication.'
                },
                'ExportRss': {
                    HeaderText: 'عرض آر إس إس',
                    Description: 'بنود النقابة مع قارئ آر إس إس.'
                },
                'Import': {
                    HeaderText: 'استيراد من ملف',
                    Description: 'تحميل CSV ، XLS ، XLSX أو سجلات الاستيراد file\u003cbr/\u003eto.'
                },
                'Update': {
                    HeaderText: 'حفظ',
                    Description: 'حفظ التغييرات إلى قاعدة البيانات.'
                },
                'Insert': {
                    HeaderText: 'حفظ',
                    Description: 'حفظ سجل جديد إلى قاعدة البيانات.',
                    Notify: 'تم الحفظ - {0}'
                },
                'Cancel': {
                    HeaderText: 'إلغاء',
                    WhenLastCommandName: {
                        'Edit': {
                            HeaderText: 'إلغاء',
                            Description: 'إلغاء جميع التغييرات السجل.'
                        },
                        'New': {
                            HeaderText: 'إلغاء',
                            Description: 'إلغاء السجل الجديد.'
                        }
                    }
                },
                'Report': {
                    HeaderText: 'تقرير',
                    Description: 'تقديم تقرير في تنسيق PDF'
                },
                'ReportAsPdf': {
                    HeaderText: 'وثيقة PDF',
                    Description: 'كما عرض العناصر أدوبي PDF document.\u003cbr/\u003eRequires قارئ متوافق.'
                },
                'ReportAsImage': {
                    HeaderText: 'متعدد الصور',
                    Description: 'عرض العناصر كصورة TIFF متعدد الصفحات.'
                },
                'ReportAsExcel': {
                    HeaderText: 'جدول',
                    Description: 'عرض العناصر في جدول بيانات Excel formatted\u003cbr/\u003eMicrosoft.'
                },
                'ReportAsWord': {
                    HeaderText: 'مايكروسوفت وورد',
                    Description: 'عرض العناصر في مستند Word formatted\u003cbr/\u003eMicrosoft.'
                },
                'DataSheet': {
                    HeaderText: 'تظهر في ورقة البيانات',
                    Description: 'عرض العناصر باستخدام sheet\u003cbr/\u003eformat البيانات.'
                },
                'Grid': {
                    HeaderText: 'تظهر في طريقة عرض قياسية',
                    Description: 'عرض العناصر في الشكل standard\u003cbr/\u003elist.'
                },
                'Tree': {
                    HeaderText: 'عرض التسلسل الهرمي',
                    Description: 'عرض العلاقات الهرمية.'
                },
                'Search': {
                    HeaderText: 'بحث',
                    Description: 'بحث {0}'
                }
            },
            'Row': {
                'Update': {
                    HeaderText: 'حفظ',
                    Notify: 'تم الحفظ - {0}',
                    WhenLastCommandName: {
                        'BatchEdit': {
                            HeaderText: 'اختيار التحديث',
                            Confirmation: 'التحديث؟'
                        }
                    }
                },
                'Insert': {
                    HeaderText: 'أدخل',
                    Notify: 'تم الحفظ - {0}'
                },
                'Cancel': {
                    HeaderText: 'إلغاء'
                }
            },
            'ActionColumn': {
                'Edit': {
                    HeaderText: 'تحرير'
                },
                'Delete': {
                    HeaderText: 'حذف',
                    Confirmation: 'حذف؟',
                    Notify: 'تم حذف {$ سيلكتد}'
                }
            }
        }
    };

    _dvr.Editor = {
        Undo: 'فك',
        Redo: 'فعل ثانية',
        Bold: 'جريء',
        Italic: 'مائل',
        Underline: 'أكد',
        Strikethrough: 'ضرب خلال',
        Subscript: 'الفرعية سكربت',
        Superscript: 'سوبر سكربت',
        JustifyLeft: 'تبرير الزمن',
        JustifyCenter: 'مركز تبرير',
        JustifyRight: 'يبرر حق',
        JustifyFull: 'تبرير كامل',
        InsertOrderedList: 'إدراج قائمة مرتبة',
        InsertUnorderedList: 'إدراج قائمة غير مرتبة',
        CreateLink: 'إنشاء رابط',
        UnLink: 'إلغاء ارتباط',
        RemoveFormat: 'إزالة تنسيق',
        SelectAll: 'حدد الكل',
        UnSelect: 'إلغاء تحديد',
        Delete: 'حذف',
        Cut: 'قطع',
        Copy: 'نسخ',
        Paste: 'لصق',
        BackColor: 'يعود اللون',
        ForeColor: 'اللون الصدارة',
        FontName: 'اسم الخط',
        FontSize: 'حجم الخط',
        Indent: 'المسافة البادئة',
        Outdent: 'إلغاء تأخير',
        InsertHorizontalRule: 'إدراج خط أفقي',
        HorizontalSeparator: 'الفاصل',
        Format: 'شكل',
        FormatBlock: {
            p: 'فقرة',
            blockquote: 'اقتباس',
            h1: 'عنوان 1',
            h2: 'العنوان 2',
            h3: 'العنوان 3',
            h4: 'العنوان 4',
            h5: 'العنوان 5',
            h6: 'العنوان 6'
        },
        Rtf: {
            editor: 'تكبير الشاشة'
        }
    };

    _dvr.Mobile = {
        UpOneLevel: 'أعلى بمستوى واحد',
        Back: 'ظهر',
        BatchEdited: '{0} محدث',
        Sort: 'نوع',
        Sorted: 'مرتبة',
        SortedDefault: 'ترتيب الافتراضي.',
        SortByField: 'حدد حقل لتغيير ترتيب الفرز \u003cb\u003e{0}\u003c/b\u003e.',
        SortByOptions: 'حدد ترتيب الفرز \u003cb\u003e{0}\u003c/b\u003e حسب الحقل \u003cb\u003e{1}\u003c/b\u003e في قائمة من الخيارات أدناه.',
        DefaultOption: 'الافتراضي',
        Auto: 'السيارات',
        Filter: 'مرشح',
        List: 'قائمة',
        Cards: 'بطاقات',
        Grid: 'شبكة',
        Map: 'خريطة',
        Calendar: 'تقويم',
        ZoomIn: 'تكبير',
        ZoomOut: 'تصغير',
        Directions: 'الاتجاهات',
        AlternativeView: 'حدد وجهة نظر بديلة من البيانات.',
        PresentationStyle: 'تحديد نمط عرض البيانات.',
        LookupViewAction: 'رأي',
        LookupSelectAction: 'حدد',
        LookupClearAction: 'واضح',
        LookupNewAction: 'جديد',
        LookupInstruction: 'الرجاء اختيار \u003cb\u003e{0}\u003c/b\u003e في القائمة.',
        LookupOriginalSelection: 'اختيار الأصلي هو \u003cb\u003e \u0026quot;{0}\u0026quot; \u003c/b\u003e.',
        EmptyContext: 'الإجراءات ليست متاحة.',
        Favorites: 'المفضلة',
        History: 'تاريخ',
        FilterSiteMap: 'خريطة الموقع تصفية ...',
        ResumeLookup: 'استئناف بحث',
        ResumeEntering: 'استئناف دخول',
        ResumeEditing: 'استئناف التحرير',
        ResumeBrowsing: 'استئناف التصفح',
        ResumeViewing: 'استئناف عرض',
        Menu: 'قائمة الطعام',
        Home: 'منزل',
        Settings: 'إعدادات',
        Sidebar: 'الشريط الجانبي',
        Landscape: 'صور الطبيعة',
        Portrait: 'صورة',
        Never: 'أبدا',
        Always: 'دائما',
        ShowSystemButtons: 'أزرار نظام عرض',
        OnHover: 'على التحويم',
        ButtonShapes: 'الأشكال زر',
        PromoteActions: 'تعزيز الإجراءات',
        ConfirmReload: 'تحديث؟',
        ClearText: 'نص واضح',
        SeeAll: 'انظر جميع',
        More: 'أكثر',
        TouchUINotSupported: 'غير معتمد لمسة واجهة المستخدم في هذا المتصفح.',
        ShowingItemsInfo: 'عرض {0} البنود.',
        FilterByField: 'حدد حقلا لتطبيق فلتر ل\u003cb\u003e{0}\u003c/b\u003e.',
        Apply: 'تطبيق',
        FilterByOptions: 'تحديد خيارات واحد أو أكثر في القائمة أدناه ثم اضغط \u003cb\u003e{2}\u003c/b\u003e لتصفية \u003cb\u003e{0}\u003c/b\u003e حسب الحقل \u003cb\u003e{1}\u003c/b\u003e.',
        Suggestions: 'اقتراحات',
        UnSelect: 'إلغاء تحديد',
        AdvancedSearch: 'البحث المتقدم',
        QuickFindScope: 'بحث في ...',
        AddMatchingGroup: 'إضافة مجموعة مطابقة',
        MatchAll: 'تطابق كل الشروط',
        MatchAny: 'تطابق اي شروط',
        DoNotMatchAll: 'لا تطابق كل الشروط',
        DoNotMatchAny: 'لا تطابق اي شروط',
        MatchAllPastTense: 'يقابل كل الظروف',
        MatchAnyPastTense: 'يقابل أي ظرف من الظروف',
        DoNotMatchAllPastTense: 'لم تطابق كل الشروط',
        DoNotMatchAnyPastTense: 'لم تطابق اي شروط',
        In: 'في',
        Recent: 'آخر',
        Matched: 'يقابل',
        DidNotMatch: 'لم يطابق',
        ClearFilter: 'واضحة تصفية (فلترة)',
        ResetSearchConfirm: 'هل تريد إعادة تعيين شروط البحث؟',
        FilterCleared: 'تم مسح جميع الفلاتر.',
        AdvancedSearchInstruction: 'أدخل الشروط التي يجب أن يقابل وزر البحث الصحافة.',
        Group: 'مجموعة',
        Grouped: 'مجمعة',
        GroupedDefault: 'تمت إزالة التجميع',
        GroupedBy: 'مجمعة حسب',
        GroupByField: 'حدد حقل لمجموعة \u003cb\u003e{0}\u003c/b\u003e.',
        Show: 'تبين',
        Hide: 'إخفاء',
        None: 'لا شيء',
        Next: 'التالى',
        Prev: 'السابق',
        FitToWidth: 'صالح للعرض',
        MultiSelection: 'اختيار متعدد',
        ItemsSelectedOne: '{0} البند اختيار',
        ItemsSelectedMany: '{0} العناصر المحددة',
        TypeToSearch: 'اكتب لبحث',
        NoMatches: 'لا توجد مباريات.',
        ShowingItemsRange: 'عرض {0} {1} من البنود',
        Finish: 'نهاية',
        ShowOptions: 'عرض الخيارات',
        ConfirmContinue: 'استمر؟',
        AddAccount: 'إضافة حساب',
        Fullscreen: 'تكبير الشاشة',
        ExitFullscreen: 'الخروج من الشاشة الكاملة',
        Apps: 'التطبيقات',
        Forget: 'ننسى',
        ManageAccounts: 'إدارة الحسابات',
        SignedOut: 'تسجيل الخروج',
        Submit: 'عرض',
        Error: 'خطأ',
        Line: 'خط',
        Download: 'تحميل',
        Orientation: 'اتجاه',
        Device: 'جهاز',
        ShowMore: 'أظهر المزيد',
        ShowLess: 'إظهار أقل',
        WithSpecifiedFilters: 'مع المرشحات المحددة',
        WithSelectedValues5: 'مع القيم المحددة (أعلى 5)',
        WithSelectedValues10: 'مع القيم المحددة (أعلى 10)',
        DisplayDensity: {
            Label: 'عرض الكثافة',
            List: {
                Tiny: 'صغير',
                Condensed: 'الموجزة',
                Compact: 'مدمج',
                Comfortable: 'مريح'
            }
        },
        Files: {
            KB: 'KB',
            MB: 'KB',
            Bytes: 'بايت',
            Drop: 'إسقاط الملف هنا',
            DropMany: 'إسقاط الملفات هنا',
            Tap: 'انقر لتحديد ملف',
            TapMany: 'انقر لتحديد ملفات',
            Click: 'انقر لتحديد ملف',
            ClickMany: 'انقر لتحديد ملفات',
            Clear: 'واضح',
            ClearConfirm: 'واضح؟',
            Sign: 'التوقيع هنا'
        },
        Import: {
            SelectFile: 'حدد ملف البيانات في CSV، XLS، XLSX أو شكل.',
            NotSupported: 'تنسيق البيانات من \u0026quot;{0}\u0026quot; غير معتمدة.',
            NotMatched: '(غير متطابق)',
            FileStats: 'هناك سجلات \u003cb\u003e{0}\u003c/b\u003e في ملف \u003cb\u003e{1}\u003c/b\u003e على استعداد لتتم معالجتها. يرجى تطابق أسماء الحقول.',
            Importing: 'استيراد',
            Into: 'إلى',
            StartImport: 'بدء الاستيراد',
            InsertingRecords: 'إدراج سجلات',
            TestingRecords: 'سجلات الاختبار',
            ResolvingReferences: 'حل المراجع',
            Complete: 'اكتمال',
            Expected: 'من المتوقع أن تكمل',
            Remaining: 'من المتوقع أن تكمل',
            Done: 'استيراد الانتهاء',
            Duplicates: 'التكرارات'
        },
        Themes: {
            Label: 'موضوع',
            Accent: 'لهجة',
            List: {
                None: 'لا شيء',
                Light: 'ضوء',
                Dark: 'مظلم',
                Aquarium: 'حوض السمك',
                Azure: 'أزرق سماوي',
                Belltown: 'بيلتون',
                Berry: 'حبة',
                Bittersweet: 'حلو ومر',
                Cay: 'جزيرة صغيرة منخفضة',
                Citrus: 'ليمون',
                Classic: 'كلاسيكي',
                Construct: 'بناء',
                Convention: 'اتفاقية',
                DarkKnight: 'فارس الظلام',
                Felt: 'شعر',
                Graham: 'غراهام',
                Granite: 'صوان',
                Grapello: 'Grapello',
                Gravity: 'خطورة',
                Lacquer: 'ورنيش',
                Laminate: 'صفح',
                Lichen: 'حزاز',
                Mission: 'مهمة',
                Modern: 'حديث',
                ModernRose: 'روز الحديثة',
                Municipal: 'بلدي',
                Petal: 'البتلة',
                Pinnate: 'ريشي الشكل',
                Plastic: 'البلاستيك',
                Ricasso: 'Ricasso',
                Simple: 'بسيط',
                Social: 'اجتماعي',
                Summer: 'الصيف',
                Vantage: 'أفضلية',
                Verdant: 'أخضر',
                Viewpoint: 'وجهة نظر',
                WhiteSmoke: 'الأبيض التدخين',
                Yoshi: 'يوشي'
            }
        },
        Transitions: {
            Label: 'التحولات',
            List: {
                none: 'لا شيء',
                slide: 'انخفاض',
                fade: 'تلاشى',
                pop: 'فرقعة',
                flip: 'نقف',
                turn: 'منعطف',
                flow: 'تدفق',
                slideup: 'الانزلاق لأعلى',
                slidedown: 'إنزل'
            }
        },
        LabelsInList: {
            Label: 'تسميات في قائمة',
            List: {
                DisplayedAbove: 'عرض فوق',
                DisplayedBelow: 'عرض بالأسفل'
            }
        },
        InitialListMode: {
            Label: 'وضع قائمة أولية',
            List: {
                SeeAll: 'انظر جميع',
                Summary: 'ملخص'
            }
        },
        Dates: {
            SmartDates: 'تواريخ الذكية',
            Yesterday: 'اليوم السابق',
            Last: 'آخر',
            Today: 'اليوم',
            OneHour: 'قبل ساعة',
            MinAgo: 'منذ {0} دقيقة',
            AMinAgo: 'منذ دقيقة مضت',
            InHour: 'خلال ساعة',
            InMin: 'في دقيقة {0}',
            InAMin: 'في دقيقة',
            Now: 'الآن',
            JustNow: 'الآن فقط',
            Tomorrow: 'يوم غد',
            Next: 'التالى'
        },
        Develop: {
            Tools: 'ادوات المطورين',
            Explorer: 'مستكشف المشاريع',
            FormLayout: 'تخطيط النموذج',
            FormLayoutInstr: 'حدد أحجام الشاشة ليتم تضمينها في التخطيط.'
        }
    };

    _dvr.Presenters = {
        Charts: {
            Text: 'الرسوم البيانية',
            DataWarning: 'الحد الأقصى لعدد المواد إلى العملية هو {0: د}. انقر هنا لتصفية النتيجة.',
            ShowData: 'إظهار البيانات',
            ShowChart: 'مشاهدة الرسم البياني',
            Sizes: {
                Label: 'حجم',
                Small: 'صغير',
                Medium: 'متوسط',
                Large: 'كبير'
            },
            ChartLabels: {
                By: 'بواسطة',
                Top: 'أعلى',
                Other: 'آخر',
                Blank: 'فراغ',
                GrandTotals: 'المجاميع الكبرى',
                CountOf: 'عدد من',
                SumOf: 'مجموع',
                AvgOf: 'المتوسط',
                MinOf: 'الحد الأدنى من',
                MaxOf: 'أقصى',
                Quarter: 'ربع',
                Week: 'أسبوع'
            }
        },
        Calendar: {
            Text: 'تقويم',
            Today: 'اليوم',
            Noon: 'وقت الظهيرة',
            Year: 'سنة',
            Month: 'شهر',
            Week: 'أسبوع',
            Day: 'يوم',
            Agenda: 'جدول أعمال',
            Sync: 'المزامنة',
            Less: 'أقل'
        }
    };

    // membership resources

    var _mr = Web.MembershipResources = {};

    _mr.Bar = {
        LoginLink: 'دخول',
        LoginText: ' لهذا الموقع',
        HelpLink: 'مساعدة',
        UserName: 'اسم المستخدم:',
        Password: 'كلمة السر:',
        RememberMe: 'تذكرني في المرة القادمة',
        ForgotPassword: 'نسيت كلمة السر؟',
        SignUp: 'اشترك الآن',
        LoginButton: 'دخول',
        MyAccount: 'حسابي',
        LogoutLink: 'خروج',
        HelpCloseButton: 'قريب',
        HelpFullScreenButton: 'كامل الشاشة',
        UserIdle: 'هل ما زلت هناك؟ الرجاء تسجيل الدخول مرة أخرى.',
        History: 'تاريخ',
        Permalink: 'الرابط الثابت',
        AddToFavorites: 'أضف إلى المفضلة',
        RotateHistory: 'تناوب',
        Welcome: 'ترحيب <b>{0}</b>, اليوم {1:D}',
        ChangeLanguageToolTip: 'تغيير لغتك',
        PermalinkToolTip: 'إنشاء ارتباط دائم للالسجل المحدد',
        HistoryToolTip: 'عرض سجلات التاريخ المحدد مسبقا',
        AutoDetectLanguageOption: 'Auto Detect'
    };

    _mr.Messages = {
        InvalidUserNameAndPassword: 'اسم المستخدم وكلمة المرور غير صالحة.',
        BlankUserName: 'يمكن أن لا يكون اسم المستخدم فارغا.',
        BlankPassword: 'كلمة السر لا يمكن أن يكون فارغا.',
        PermalinkUnavailable: 'الرابط الثابت غير متوفر. الرجاء اختيار رقما قياسيا.',
        HistoryUnavailable: 'التاريخ غير متوفر.'
    };

    _mr.Manager = {
        UsersTab: 'المستخدمين',
        RolesTab: 'الأدوار',
        UsersInRole: 'المستخدمين في دور'
    };

    if (typeof Sys !== 'undefined') Sys.Application.notifyScriptLoaded();
})();