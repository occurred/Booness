<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Create a new Affaire</title>
    <meta content="main" name="layout"/>
  </head>
  <body>
    choose a Compte here!
  <g:form action="wizard">
    <g:select name="compte" id="compte" from="${fr.booness.Compte.list()}"></g:select>
    <g:submitButton name="new" value="Create a New Compte"/>
    <g:submitButton name="next" value="Next"/>
  </g:form>

</body>
</html>
