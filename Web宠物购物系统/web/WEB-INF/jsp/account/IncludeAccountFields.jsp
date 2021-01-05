<%--
  Created by IntelliJ IDEA.
  User: 杨震宇
  Date: 2020/11/10
  Time: 19:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<h3>Account Information</h3>

<table>
    <tr>
        <td>First name:</td>
        <td><input type="text" name="firstName" /></td>
    </tr>
    <tr>
        <td>Last name:</td>
        <td><input type="text" name="lastName" /></td>
    </tr>
    <tr>
        <td>Email:</td>
        <td><input type="text" name="email" /></td>
    </tr>
    <tr>
        <td>Phone:</td>
        <td><input type="text" name="phone" /></td>
    </tr>
    <tr>
        <td>Address 1:</td>
        <td><input type="text" name="address1" /></td>
    </tr>
    <tr>
        <td>Address 2:</td>
        <td><input type="text" name="address2" size="40" /></td>
    </tr>
    <tr>
        <td>City:</td>
        <td><input type="text" name="city" /></td>
    </tr>
    <tr>
        <td>State:</td>
        <td><input type="text" name="state" size="4" /></td>
    </tr>
    <tr>
        <td>Zip:</td>
        <td><input type="text" name="zip" size="10" /></td>
    </tr>
    <tr>
        <td>Country:</td>
        <td><input type="text" name="country" size="15" /></td>
    </tr>
</table>

<h3>Profile Information</h3>

<table>
    <tr>
        <td>Language Preference:</td>
        <td><select name="languagePreference">
            <!-- 循环 -->
            <option>${language }</option>

        </select></td>
    </tr>
    <tr>
        <td>Favourite Category:</td>
        <td><select name="account.favouriteCategoryId">
            <option value="FISH">FISH</option>
            <option selected="selected" value="DOGS">DOGS</option>
            <option value="REPTILES">REPTILES</option>
            <option value="CATS">CATS</option>
            <option value="BIRDS">BIRDS</option>
        </select></td>
    </tr>
    <tr>
        <td>Enable MyList</td>
        <td><input type="checkbox" name="listOption" value="1" /></td>
    </tr>
    <tr>
        <td>Enable MyBanner</td>
        <td><input type="checkbox" name="bannerOption" value="1" /></td>
    </tr>

</table>

