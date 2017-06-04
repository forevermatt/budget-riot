<bb-page-income-account>
  <bb-account-selector accounts="{ opts.accounts }"></bb-account-selector>
  <bb-button-row buttons="{ this.buttons }" next="{ opts.next }"></bb-button-row>

  <script>
  this.buttons = [
    new bb.Button('back', 'circle-arrow-left', '#income/summary', true)
  ];
  </script>
</bb-page-income-account>
