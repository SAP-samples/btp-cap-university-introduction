using ModulesService as service from '../../srv/modules-service';
annotate service.Modules with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'name',
                Value : name,
            },
            {
                $Type : 'UI.DataField',
                Label : 'credits',
                Value : credits,
            },
            {
                $Type : 'UI.DataField',
                Label : 'weights',
                Value : weights,
            },
            {
                $Type : 'UI.DataField',
                Label : 'hasFixedWeight',
                Value : hasFixedWeight,
            },
            {
                $Type : 'UI.DataField',
                Label : 'validFrom',
                Value : validFrom,
            },
            {
                $Type : 'UI.DataField',
                Label : 'validTo',
                Value : validTo,
            },
            {
                $Type : 'UI.DataField',
                Label : 'isMandatory',
                Value : isMandatory,
            },
            {
                $Type : 'UI.DataField',
                Label : 'isFinalThesis',
                Value : isFinalThesis,
            },
            {
                $Type : 'UI.DataField',
                Label : 'additionalInfo',
                Value : additionalInfo,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'name',
            Value : name,
        },
        {
            $Type : 'UI.DataField',
            Label : 'credits',
            Value : credits,
        },
        {
            $Type : 'UI.DataField',
            Label : 'weights',
            Value : weights,
        },
        {
            $Type : 'UI.DataField',
            Label : 'hasFixedWeight',
            Value : hasFixedWeight,
        },
        {
            $Type : 'UI.DataField',
            Label : 'validFrom',
            Value : validFrom,
        },
    ],
    UI.Identification : [
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'ModulesService.assign',
            Label : 'assign',
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'ModulesService.unassign',
            Label : 'unassign',
        },
    ],
);

