<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Affaire</title>
    <meta content="main" name="layout"/>
  </head>
  <body>
    <br/>
    <h2>Compte : ${fr.booness.Compte.get(params.compte?.id)}</h2>
    <h2>Creation d'une affaire :</h2>
  <g:form action="save" method="post">
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
    <input type="hidden" name="compte.id" value="${params.compte?.id}" id="compte.id" />
    <g:submitButton class="save" name="save" action="save" value="${message(code: 'create', 'default': 'Create')}"/>
  </g:form>
</body>
</html>
