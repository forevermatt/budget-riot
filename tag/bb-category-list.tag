<bb-category-list>
  <table id="category-list" class="table table-condensed">
    <tbody>
      <tr each="{ opts.categories }">
        <td class="category-name width-10">
          <a href="#history/category" class="btn btn-default">{ name }</a></td>
        <td class="width-80">
          <div class="category-graph { dangerIfNegative(remaining) }">
            <div class="category-graph-line { status(remaining, total) }" style="width: { width(remaining, total) }%;"></div>
          </div>
        </td>
        <td class="category-amount width-10">
          <span class="category-available { dangerIfNegative(remaining) }"><sup>$</sup>{ remaining }</span>
          <span class="category-budgeted">/ { total }</span>
        </td>
      </tr>
    </tbody>
  </table>
  <p if="{ opts.new }">
    <a href="#category/new">
      <span class="glyphicon glyphicon-asterisk"></span>
      Add a new category
    </a>
  </p>

  <script>
    dangerIfNegative(remaining) {
      return (remaining >= 0 ? '' : 'danger');
    }

    status(remaining, total) {
      if (remaining < 0) {
        return 'danger';
      } else if (remaining < (total / 4)) {
        return 'warning';
      }
      return 'success';
    }

    width(remaining, total) {
      if (remaining < 0) {
        return 0;
      } else if (total === 0) {
        return 0;
      }
      return (remaining / total) * 100;
    }
  </script>
</bb-category-list>
