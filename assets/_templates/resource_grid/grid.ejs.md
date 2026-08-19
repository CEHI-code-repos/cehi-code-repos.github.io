::: {.list .grid .quarto-listing-cols-4}

<% for (const item of items) { %>

::: {.g-col-1 <%= metadataAttrs(item) %> }

```{=html}
<a href="<%- item.path %>" class="quarto-grid-link text-decoration-none text-dark d-flex flex-column h-100">
<div class="quarto-grid-item card h-100 card-left d-flex flex-column" style="overflow: hidden;">
```

<!-- ojs figure integration -->
<% if (item['ojs-code']) { %>

```{=html}
<div class="card-img-top listing-ojs-target flex-shrink-0" 
     data-ojs-code="<%= item['ojs-code'] %>" 
     style="height: 200px; background: #f8f9fa; border-bottom: 1px solid #dee2e6; display: block; width: 100%;">
</div>
```

<% } else { %>

```{=html}
<p class="card-img-top flex-shrink-0" style="height: 200px; background: #f8f9fa; margin-bottom: 0;">
  nothing rn
</p>
```

<% } %>

<!-- title, subtitle -->
::: {.card-body .post-contents .flex-grow-1}

<h5 class="no-anchor card-title listing-title"><%= item.title %></h5>
<div class="card-subtitle listing-subtitle"><%= item.subtitle %></div>

:::

```{=html}
</div></a>
```

:::

<% } %>

:::
