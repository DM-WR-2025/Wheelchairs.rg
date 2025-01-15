<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Wheelchair Registration Form</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7fa;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 60%;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-top: 50px;
        }

        h2 {
            text-align: center;
            color: red;  /* Set the text color to red */
            font-size: 24px;
            margin-bottom: 20px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.7);  /* Add black shadow effect */
        }

        label {
            font-size: 16px;
            margin: 10px 0;
            color: #555;
            display: block;
        }

        input, select, button {
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 16px;
        }

        .medium-input {
            width: 50%;
            display: inline-block;
        }

        input[type="radio"] {
            width: auto;
            margin-right: 10px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .radio-group {
            display: flex;
            align-items: center;
        }

        .radio-group label {
            margin-right: 20px;
        }

        button {
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 18px;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #0056b3;
        }

        .form-group select {
            width: auto;
            display: inline-block;
            width: 50%;
        }

        .form-group input[type="file"] {
            padding: 5px;
        }

        .hidden {
            display: none;
        }

        .form-section {
            margin-bottom: 20px;
        }

        .form-section label {
            font-weight: bold;
        }

        .wheelchair-select {
            display: inline-block;
            width: 100%;
            padding: 10px;
        }

        .wheelchair-select select {
            width: 50%;
        }

        .footer {
            text-align: center;
            font-size: 14px;
            color: #777;
            margin-top: 40px;
        }
    </style>
    <script>
        function showWheelchairOptions() {
            var desk = document.getElementById("desk").value;
            var wheelchairOptions = document.getElementById("wheelchair-options");
            wheelchairOptions.innerHTML = ''; // Clear current wheelchair options
            var startNumber = 0;

            // Set the starting wheelchair number based on the desk selected
            if (desk == 'BA') {
                startNumber = 1;
            } else if (desk == 'F') {
                startNumber = 4;
            } else if (desk == 'H') {
                startNumber = 7;
            } else if (desk == 'GA') {
                startNumber = 10;
            } else if (desk == 'GD') {
                startNumber = 12;
            }

            // Create wheelchair options starting from the defined number
            var maxWheelchairs = (desk == 'GA' || desk == 'GD') ? 2 : 3;

            for (var i = startNumber; i < startNumber + maxWheelchairs; i++) {
                wheelchairOptions.innerHTML += `<option value="${i}">${i}</option>`;
            }
        }

        function toggleSecurityDepositOptions() {
            var depositType = document.querySelector('input[name="deposit-type"]:checked').value;
            var idFields = document.getElementById("id-fields");
            var cashFields = document.getElementById("cash-fields");
            var handedOverFields = document.getElementById("handed-over-fields");

            // Show relevant fields based on selected deposit type
            if (depositType == 'id-license') {
                idFields.classList.remove('hidden');
                cashFields.classList.add('hidden');
                handedOverFields.classList.add('hidden');
            } else if (depositType == 'cash') {
                idFields.classList.add('hidden');
                cashFields.classList.remove('hidden');
                handedOverFields.classList.add('hidden');
            } else if (depositType == 'security') {
                idFields.classList.add('hidden');
                cashFields.classList.add('hidden');
                handedOverFields.classList.remove('hidden');
            }
        }
    </script>
</head>
<body>
    <div class="container">
        <h2>Wheelchair Registration Form</h2>
        <form action="https://script.google.com/macros/s/AKfycbxVO23PuUc2S7DmmBdsJ5w2l-8aAfZOMPqw00iMJ4MHu7xnzgrrUuWE7MoAjV0WB43jJA/exec" method="POST" enctype="multipart/form-data">
            <div class="form-group">
                <label for="customer-name">Customer Name:</label>
                <input type="text" id="customer-name" name="customer-name" required class="medium-input">
            </div>

            <div class="form-group">
                <label for="phone">Phone Number:</label>
                <input type="tel" id="phone" name="phone" required class="medium-input">
            </div>

            <div class="form-group">
                <label for="nationality">Nationality:</label>
                <input type="text" id="nationality" name="nationality" required class="medium-input">
            </div>

            <div class="form-group">
                <label for="desk">Select Desk:</label>
                <select id="desk" name="desk" onchange="showWheelchairOptions()" required>
                    <option value="" disabled selected>Select a desk</option>
                    <option value="BA">BA Desk</option>
                    <option value="F">F Desk</option>
                    <option value="H">H Desk</option>
                    <option value="GA">GA Desk</option>
                    <option value="GD">GD Desk</option>
                </select>
            </div>

            <div class="form-group wheelchair-select">
                <label for="wheelchair-options">Select Wheelchair Number:</label>
                <select id="wheelchair-options" name="wheelchair" required>
                    <!-- Options will be dynamically added based on desk selection -->
                </select>
            </div>

            <div class="form-section">
                <label>Security Deposit:</label>
                <div class="radio-group">
                    <input type="radio" id="id-license" name="deposit-type" value="id-license" onclick="toggleSecurityDepositOptions()" required>
                    <label for="id-license">ID and License</label>

                    <input type="radio" id="cash" name="deposit-type" value="cash" onclick="toggleSecurityDepositOptions()">
                    <label for="cash">Cash</label>

                    <input type="radio" id="security" name="deposit-type" value="security" onclick="toggleSecurityDepositOptions()">
                    <label for="security">Handed over to Security</label>
                </div>
            </div>

            <div id="id-fields" class="form-group hidden">
                <label for="id-number">ID Number:</label>
                <input type="text" id="id-number" name="id-number">
            </div>

            <div id="cash-fields" class="form-group hidden">
                <label for="cash-amount">Cash Amount:</label>
                <input type="number" id="cash-amount" name="cash-amount">
            </div>

            <div id="handed-over-fields" class="form-group hidden">
                <label for="security-image">Attach Security Image:</label>
                <input type="file" id="security-image" name="security-image"><br><br>

                <label for="security-id">Security ID Number:</label>
                <input type="text" id="security-id" name="security-id"><br><br>
            </div>

            <div class="form-group">
                <label for="last-date">Last Date:</label>
                <input type="date" id="last-date" name="last-date" class="medium-input" required>
            </div>

            <div class="form-group">
                <label for="csa-name">CSA Name:</label>
                <input type="text" id="csa-name" name="csa-name" class="medium-input" required>
            </div>

            <button type="submit">Submit</button>
        </form>
    </div>
    <div class="footer">
        <p>&copy; 2025 Wheelchair Registration System</p>
    </div>
</body>
</html>
