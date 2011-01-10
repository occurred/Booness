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
    <br/>
    <h2>Using Compte: ${compte.name}</h2>
    <h2>Please create a new Affaire now:</h2>
  <g:form action="wizard">
    <table>
      <tbody>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="name">Name</label>
          </td>
          <td valign="top" class="value ">

            <input type="text" name="name" value="" id="name" />
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="description">Description</label>
          </td>
          <td valign="top" class="value ">

            <textarea name="description" cols="40" rows="5" id="description" ></textarea>
          </td>
        </tr>

      </tbody>
    </table>

    <g:submitButton name="previous" value="Previous"/>
    <g:submitButton name="finish" value="Finish"/>
  </g:form>
</body>
</html>
