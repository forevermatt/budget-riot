<bb-category-list>
  <table id="category-list" class="table table-condensed">
    <tbody>
      <tr each="{ category, categoryId in opts.dm.getCategories() }">
        <td class="category-name width-10">
          <a href="#history/category/{ categoryId }" class="btn btn-default">{ category.name }</a></td>
        <td class="width-80">
          <div class="category-graph { dangerIfNegative(opts.dm.getCategoryRemaining(categoryId)) }">
            <div class="category-graph-line { status(category.remaining, category.budgetedAmount) }"
                 style="width: { width(category.remaining, category.budgetedAmount) }%;"></div>
          </div>
        </td>
        <td class="category-amount width-10">
          <span class="category-available { dangerIfNegative(category.remaining) }">
            <sup>$</sup>{ bb.Transaction.format(category.remaining) }
          </span>
          <span class="category-budgeted">/ { bb.Transaction.formatWhole(category.budgetedAmount) }</span>
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
      if ((remaining != undefined) && (remaining < 0)) {
        return 'danger';
      }
      return '';
    }

    status(remaining, total) {
      if (remaining == undefined) {
        return '';
      } else if (remaining < 0) {
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
