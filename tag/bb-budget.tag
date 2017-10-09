<bb-budget>
  <table id="category-list" class="table table-condensed">
    <tbody>
      <tr each="{ category, categoryId in opts.dm.getCategories() }">
        <td class="category-name width-10">
          <a href="#history/category/{ categoryId }"
             class="btn btn-default">{ category.name }</a>
        </td>
        <td class="width-80">
          <div class="category-graph { dangerIfNegative(getRemainingFor(categoryId)) }">
            <div class="category-graph-line { status(getRemainingFor(categoryId), this.budget[categoryId] || 0) }"
                 style="width: { width(getRemainingFor(categoryId), this.budget[categoryId] || 0) }%;"></div>
          </div>
        </td>
        <td class="category-amount width-10">
          <bb-ratio remaining="{ getRemainingFor(categoryId) }"
                    budgeted="{ amount }"></bb-ratio>
          <span class="category-available { dangerIfNegative(getRemainingFor(categoryId)) }">
            <sup>$</sup>{ bb.Transaction.format(getRemainingFor(categoryId)) }
          </span>
          <span class="category-budgeted">/ { bb.Transaction.formatWhole(this.budget[categoryId] || 0) }</span>
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
