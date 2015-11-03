  <footer id="footer">
    <div class="muted text-center">&copy; 2015, Collaborative</div>
  </footer>
  <script src="js/jquery.js"></script> 
  <script src="js/bootstrap.min.js"></script> 
  <script src="js/custom.js"></script>
<script>
	$(document).ready(function() {
		$('form').on('submit', function() {
			return checkMandatoryFields();
		});
	});
</script>