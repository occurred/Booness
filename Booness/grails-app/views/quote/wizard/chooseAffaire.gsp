<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Create a new Quote</title>
    <meta content="main" name="layout"/>
  </head>
  <body>
    choose a Affaire here!
  <g:form action="wizard">
    <g:select name="affaire" id="affaire" from="${fr.booness.Affaire.list()}"></g:select>
    <g:submitButton name="next" value="Next"/>
  </g:form>
</body>
</html>
