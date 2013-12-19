
Sample ruhoh website demonstrating the `page.filter` custom plugin (see plugins folder).

`page.filter` is the same as `collection.filter` only it automatically scopes itself to the directory that `page` is in.


```html
<h3>Track Listings</h3>
<ul>
{{# page.filter.tracks/ }}
  <li>
    <a href="{{ url }}">({{ title }}) {{ url }}</a>
  </li>
{{/ page.filter.tracks/ }}
</ul>
```

Examples can be seen by running this website and going to:

- <http://localhost:9292/albums/one>
- <http://localhost:9292/albums/two>
- <http://localhost:9292/albums/three>