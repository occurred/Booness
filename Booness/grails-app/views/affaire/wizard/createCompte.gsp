<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Create a new Compte</title>
    <meta content="main" name="layout"/>
  </head>
  <body>
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

        <tr class="prop">
          <td valign="top" class="street">
            <label for="name">Street</label>
          </td>
          <td valign="top" class="value ">

            <input type="text" name="street" value="" id="street" />
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="zip">
            <label for="name">ZIP</label>
          </td>
          <td valign="top" class="value ">

            <input type="text" name="zip" value="" id="zip" />
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="city">
            <label for="name">City</label>
          </td>
          <td valign="top" class="value ">

            <input type="text" name="city" value="" id="city" />
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="country">
            <label for="name">Country</label>
          </td>
          <td valign="top" class="value ">

            <input type="text" name="country" value="" id="country" />
          </td>
        </tr>
      </tbody>
    </table>
    <g:submitButton name="previous" value="Previous"/>
    <g:submitButton name="save" value="Save and Next"/>
  </g:form>
</body>
</html>
