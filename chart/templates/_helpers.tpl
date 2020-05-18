{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{define "<CHARTNAME>.name"}}{{default "<CHARTNAME>" .Values.nameOverride | trunc 63 | trimSuffix "-" }}{{end}}

{{/*
Create a default fully qualified app name.

We truncate at 63 chars because some Kubernetes name fields are limited to this
(by the DNS naming spec).
*/}}
{{define "<CHARTNAME>.fullname"}}
{{- $name := default "<CHARTNAME>" .Values.nameOverride -}}
{{printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{end}}

{{/*
Provide a pre-defined claim or a claim based on the Release
*/}}
{{- define "<CHARTNAME>.pvcName" -}}
{{- if .Values.persistence.existingClaim }}
{{- .Values.persistence.existingClaim }}
{{- else -}}
{{- template "<CHARTNAME>.fullname" . }}
{{- end -}}
{{- end -}}

