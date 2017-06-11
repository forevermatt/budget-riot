<bb-amount-selector>
  <form class="pad-vertical text-center" novalidate onsubmit="{ formSubmitted }">
    <div class="input-group input-group-lg">
      <span class="input-group-addon">$</span>
      <input type="tel" autofocus="autofocus" class="form-control"
             id="amount" onkeydown="{ keyDown }" ref="amount"
             value="{ opts.transaction.amount }" aria-label="Amount">
    </div>
  </form>

  <script>
  this.on('mount', function() {
    this.refs.amount.focus();
  });

  this.numeralsEntered = [];

  formSubmitted(formEvent) {
    formEvent.preventUpdate = true;
    this.trigger('next');
  }

  getNumericCharFrom(code) {
    if (code >= 48 && code < 58) {
      return String(code - 48);
    } else if (code >= 96 && code < 106) {
      return String(code - 96);
    }
    return '';
  }

  isBackspace(code) {
    return (code === 8);
  }

  isPrintable(code) {
    return (code >= 32 && code < 112) ||
           (code >= 123 && code < 127) ||
           (code >= 186);
  }

  keyDown(keyEvent) {
    var code = keyEvent.which;
    if (this.isPrintable(code)) {
      keyEvent.preventDefault();
    }

    var numericCharEntered = this.getNumericCharFrom(code);
    if (numericCharEntered) {
      this.numeralsEntered.push(numericCharEntered);
    } else if (this.isBackspace(code)) {
      keyEvent.preventDefault();
      this.numeralsEntered.pop();
    }

    this.showNumerals(this.numeralsEntered);
    this.recordAmount(this.refs.amount.value);
  }

  recordAmount(amountText) {
    opts.transaction.amount = Number(amountText).toFixed(2);
  };

  showNumerals(numerals) {
    var text = '';

    for (var i = 0; i < numerals.length; i++) {
      if (i === (numerals.length - 2)) {
        text += '.';
      }
      text += numerals[i];
    }

    if (text.length === 0) {
      text = '0.00';
    } else if (text.length === 1) {
      text = '0.0' + text;
    } else if (text.length === 2) {
      text = '0.' + text;
    } else if (text.length === 3) {
      text = '0' + text;
    }

    this.refs.amount.value = text;
  }
  </script>
</bb-amount-selector>
