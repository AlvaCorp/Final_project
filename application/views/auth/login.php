<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<?=base_url('assets')?>/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<?=base_url('assets')?>/bootstrap/css/login.css">
    <style type="text/css">
        body {
            padding-top: 30px;
        }
    </style>
    <script src="<?=base_url('assets')?>/plugins/jQuery/jquery.js"></script>
    <script src="<?=base_url('assets')?>/bootstrap/js/bootstrap.min.js"></script>
    <script src="<?=base_url('assets')?>/plugins/jQuery/jquery.validate.js"></script>
    <script type="text/javascript">
        // $.validator.setDefaults({
        //     submitHandler: function() { window.open ('dashboard/index2','_self',false) }
        // });
        
        $().ready(function() {
            // validate the comment form when it is submitted
            $("#commentForm").validate();
        
            // validate signup form on keyup and submit
            $("#signupForm").validate({
                rules: {
                    firstname: "required",
                    lastname: "required",
                    username: {
                        required: true,
                        minlength: 1
                    },
                    password: {
                        required: true,
                        minlength: 1
                    },
                    confirm_password: {
                        required: true,
                        minlength: 2,
                        equalTo: "#password"
                    },
                    email: {
                        required: true,
                        email: true
                    },
                    topic: {
                        required: "#newsletter:checked",
                        minlength: 2
                    },
                    agree: "required"
                },
                messages: {
                    firstname: "Please enter your firstname",
                    lastname: "Please enter your lastname",
                    username: {
                        required: "Please enter a username",
                        minlength: "Your username must consist of at least 1 character"
                    },
                    password: {
                        required: "Please provide a password",
                        minlength: "Your password must be at least 1 character long"
                    },
                    confirm_password: {
                        required: "Please provide a password",
                        minlength: "Your password must be at least 5 characters long",
                        equalTo: "Please enter the same password as above"
                    },
                    email: "Please enter a valid email address",
                    agree: "Please accept our policy"
                }
            });
        
            // propose username by combining first- and lastname
            $("#username").focus(function() {
                var firstname = $("#firstname").val();
                var lastname = $("#lastname").val();
                if(firstname && lastname && !this.value) {
                    this.value = firstname + "." + lastname;
                }
            });
        
            //code to hide topic selection, disable for demo
            var newsletter = $("#newsletter");
            // newsletter topics are optional, hide at first
            var inital = newsletter.is(":checked");
            var topics = $("#newsletter_topics")[inital ? "removeClass" : "addClass"]("gray");
            var topicInputs = topics.find("input").attr("disabled", !inital);
            // show when newsletter is checked
            newsletter.click(function() {
                topics[this.checked ? "removeClass" : "addClass"]("gray");
                topicInputs.attr("disabled", !this.checked);
            });
        });
        </script>
</head>

<body>
<div class="container">
    <div class="row">
    <div class="col-lg-offset-4 col-lg-4" style="margin-top:100px">
        <div class="block-unit" style="text-align:center; padding:8px 8px 8px 8px;">
            <img src="<?=base_url('assets')?>/dist/img/user2-160x160.jpg" alt="" class="img-circle">
            <br><br>
            <?php echo $this->session->flashdata('alert_msg'); ?>
                <form class="cmxform" id="signupForm" method="POST" action="<?php echo base_url('auth/act_login'); ?>">
                    <fieldset>
                        <p>
                            <input id="username" name="username" type="text" placeholder="Username">
                            <input id="password" name="password" type="password" placeholder="Password">
                            <br>
                            <!-- <input id="agree" name="agree" type="checkbox">
                            <i style="color: yellow">I agree to terms</i> -->
                        </p>
                            <input class="submit btn-primary btn btn-large" type="submit" value="Login">
                    </fieldset>
                </form>
        </div>
    </div>
    </div>
</div>
</body>
</html>
