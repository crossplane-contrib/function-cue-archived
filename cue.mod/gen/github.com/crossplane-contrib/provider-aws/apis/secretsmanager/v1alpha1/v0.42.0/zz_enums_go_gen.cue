// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/crossplane-contrib/provider-aws/apis/secretsmanager/v1alpha1

package v1alpha1

#FilterNameStringType: string // #enumFilterNameStringType

#enumFilterNameStringType:
	#FilterNameStringType_description |
	#FilterNameStringType_name |
	#FilterNameStringType_tag_key |
	#FilterNameStringType_tag_value |
	#FilterNameStringType_all

#FilterNameStringType_description: #FilterNameStringType & "description"
#FilterNameStringType_name:        #FilterNameStringType & "name"
#FilterNameStringType_tag_key:     #FilterNameStringType & "tag-key"
#FilterNameStringType_tag_value:   #FilterNameStringType & "tag-value"
#FilterNameStringType_all:         #FilterNameStringType & "all"

#SortOrderType: string // #enumSortOrderType

#enumSortOrderType:
	#SortOrderType_asc |
	#SortOrderType_desc

#SortOrderType_asc:  #SortOrderType & "asc"
#SortOrderType_desc: #SortOrderType & "desc"