<bb-budget>
  <table id="category-list" class="table table-condensed">
    <tbody>
      <tr each="{ category in opts.dm.getCategoriesInOrder() }">
        <td class="category-name width-10">
          <a href="#history/category/{ category.id }"
             class="btn btn-default">{ category.name }</a>
        </td>
        <td class="width-80">
          <div class="category-graph { dangerIfNegative(getRemainingFor(category.id)) }">
            <div class="category-graph-line { status(getRemainingFor(category.id), this.budget[category.id] || 0) }"
                 style="width: { width(getRemainingFor(category.id), this.budget[category.id] || 0) }%;"></div>
          </div>
        </td>
        <td class="category-amount width-10">
          <bb-ratio remaining="{ getRemainingFor(category.id) }"
                    budgeted="{ amount }"></bb-ratio>
          <span class="category-available { dangerIfNegative(getRemainingFor(category.id)) }">
            <sup>$</sup>{ bb.Transaction.format(getRemainingFor(category.id)) }
          </span>
          <span class="category-budgeted">/ { bb.Transaction.formatWhole(this.budget[category.id] || 0) }</span>
        </td>
      </tr>
    </tbody>
  </table>
  <a href="#category/new">
    <span class="glyphicon glyphicon-asterisk"></span>
    Add a new category
  </a>

  <script>
    this.yearMonthId = opts.id;
    this.budget = opts.dm.getBudgetForMonth(this.yearMonthId);

    dangerIfNegative(remaining) {
      if ((remaining != undefined) && (remaining < 0)) {
        return 'danger';
      }
      return '';
    }

    getRemainingFor() {
      /** @TODO: Get the real value. */
      return 0;
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
</bb-budget>
