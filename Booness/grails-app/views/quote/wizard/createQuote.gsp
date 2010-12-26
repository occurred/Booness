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
    Using Affaire: ${affaire.name}
    <br/>
  <g:form action="wizard">
    <table>
      <tbody>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="title">Title</label>
          </td>
          <td valign="top" class="value ">

            <input type="text" name="title" value="" id="title" />
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="isPaid">Is Paid</label>
          </td>
          <td valign="top" class="value ">
            <input type="checkbox" name="isPaid" id="isPaid"/>
          </td>
        </tr>
      </tbody>
    </table>

    <g:submitButton name="previous" value="Previous"/>
    <g:submitButton name="finish" value="Finish"/>
  </g:form>
</body>
</html>
