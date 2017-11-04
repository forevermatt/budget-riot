<bb-budget>
  <table id="category-list" class="table table-condensed">
    <tbody>
      <tr each="{ budgetCategory in this.budgetInOrder }">
        <td class="category-name width-10">
          <a href="#history/category/{ budgetCategory.categoryId }"
             class="btn btn-default">{ budgetCategory.categoryName }</a>
        </td>
        <td class="width-80">
          <div class="category-graph { dangerIfNegative(budgetCategory.remaining) }">
            <div class="category-graph-line { status(budgetCategory.remaining, budgetCategory.budgetedAmount) }"
                 style="width: { width(budgetCategory.remaining, budgetCategory.budgetedAmount) }%;"></div>
          </div>
        </td>
        <td class="category-amount width-10">
          <div class="category-available { dangerIfNegative(budgetCategory.remaining) }">
            <sup>$</sup>{ bb.Transaction.format(budgetCategory.remaining) }
          </div>
          <div class="category-budgeted"><span>/ { bb.Transaction.formatWhole(budgetCategory.budgetedAmount) }</span></div>
        </td>
      </tr>
    </tbody>
  </table>
  <a href="#category/new">
    <span class="glyphicon glyphicon-asterisk"></span>
    Add a new category
  </a>

  <script>
    this.yearMonthId = opts.id || bb.Date.getCurrentYearMonthString();
    this.budgetInOrder = opts.dm.getBudgetForMonthInOrder(this.yearMonthId);

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
        return (remaining > 0) ? 100 : 0;
      }
      return (remaining / total) * 100;
    }
  </script>
</bb-budget>
