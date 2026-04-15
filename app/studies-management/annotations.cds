using StudiesService as service from '../../srv/studies-service';
annotate service.Studies with @(
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
                Label : 'creditsForCompletion',
                Value : creditsForCompletion,
            },
            {
                $Type : 'UI.DataField',
                Label : 'duration',
                Value : duration,
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
            Label : 'creditsForCompletion',
            Value : creditsForCompletion,
        },
        {
            $Type : 'UI.DataField',
            Label : 'duration',
            Value : duration,
        },
    ],
);

