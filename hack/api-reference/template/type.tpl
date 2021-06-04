{{ define "type" }}

<br>
<h3 id="{{ anchorIDForType . }}">
    <b>{{- .Name.Name }}</b>
    {{ if eq .Kind "Alias" }}(<code>{{.Underlying}}</code> alias)</p>{{ end -}}
</h3>
{{ with (typeReferences .) }}
    <p>
        (<em>Appears on:</em>
        {{- $prev := "" -}}
        {{- range . -}}
            {{- if $prev -}}, {{ end -}}
            {{ $prev = . }}
            <a href="#?id={{ linkForType . }}">{{ typeDisplayName . }}</a>
        {{- end -}}
        )
    </p>
{{ end }}


<p>
    {{ safe (renderComments .CommentLines) }}
</p>

{{ if .Members }}
<table>
    <thead>
        <tr>
            <th>Field</th>
            <th>Type</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        {{ if isExportedType . }}
        <tr>
            <td>
                <code>apiVersion</code>
                
            </td>
            <td>
                string
            </td>
            <td>
                <code>
                    {{apiGroup .}}
                </code>
            </td>
        </tr>
        <tr>
            <td>
                <code>kind</code>
            </td>
            <td>
                string
            </td>
            <td>
                <code>{{.Name.Name}}</code>
            </td>
        </tr>
        {{ end }}
        {{ template "members" .}}
    </tbody>
</table>
{{ end }}

{{ end }}
