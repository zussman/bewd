#Form Helpers
Forms are obviously an important part of web applications. However, form markup can be really tedious and difficult to write and maintain because of the need to handle form control naming and its numerous attributes. Rails does away with that complexity by providing helpers for generating form markup. However, since the helpers have different use cases, developers need to know the differences between the helper methods before using them.

##1 Dealing with Basic Forms
The most basic form helper is the `form_tag`.

```
<%= form_tag do %>
	Form contents
<% end %>
```
When called without arguments like this, it creates a <form> tag, which, when submitted, will POST to the current page. For instance, assuming the current page is `/home/index`, the generated HTML will look like this (some line breaks added for readability):

```
<form accept-charset="UTF-8" action="/" method="post">
	<input name="utf8" type="hidden" value="&#x2713;" />
	<input name="authenticity_token" type="hidden" value="J7CBxfHalt49OSHp27hblqK20c9PgwJ108nDHX/8Cts=" />
	Form contents
</form>

You'll notice that the HTML contains `input` element with type hidden. This `input` is important, because the form cannot be successfully submitted without it. The hidden input element has name attribute of `utf8`, which tells browsers to properly respect our form's character encoding and is generated for all forms whether their actions are "GET" or "POST". The second input element with name `authenticity_token` is a security feature of Rails called **cross site request forgery protection**, and form helpers generate it for every non-GET form (provided that this security function is enabled.) You can read more about CSRFP in the [security guide](http://guides.rubyonrails.org/security.html#cross-site-request-forgery-csrf).

