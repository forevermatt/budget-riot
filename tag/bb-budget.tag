<bb-budget>
  <table id="category-list" class="table table-condensed">
    <tbody>
      <tr each="{ categoryId, amount in this.budget }">
        <td class="category-name width-10">
          <a href="#history/category/{ categoryId }"
             class="btn btn-default">{ parent.opts.dm.getCategoryName(categoryId) }</a>
        </td>
        <td class="width-80">
          <div class="category-graph { dangerIfNegative(category.remaining) }">
            <div class="category-graph-line { status(category.remaining, category.budgetedAmount) }"
                 style="width: { width(category.remaining, category.budgetedAmount) }%;"></div>
          </div>
        </td>
        <td class="category-amount width-10">
          <bb-ratio remaining="{ parent.opts.dm.getRemainingFor(parent.yearMonthId, categoryId) }"
                    budgeted="{ amount }"></bb-ratio>
          <span class="category-available { dangerIfNegative(opts.remaining) }">
            <sup>$</sup>{ bb.Transaction.format(opts.remaining) }
          </span>
          <span class="category-budgeted">/ { bb.Transaction.formatWhole(opts.budgeted) }</span>
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
