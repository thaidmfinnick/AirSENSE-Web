import * as React from 'react';
import Card from '@material-ui/core/Card';
import CardContent from '@material-ui/core/CardContent';
import CardHeader from '@material-ui/core/CardHeader';

export default () => (
    <Card>
        <CardHeader title="Welcome to the administration" />
        <CardContent>Lorem ipsum sic dolor amet...</CardContent>
        <div class="cus-dashboard-abi">
        <div class="cus-dh-abi-item dh-item-blue">
            <p class="cus-dh-item-title">Total Teacher</p>
            <span class="cus-dh-item-icon"><i class="fa fa-graduation-cap" aria-hidden="true"></i></span>
            <p class="cus-dh-item-quan">1</p>
            <p class="cus-dh-item-des">Pending Teacher <span>0</span></p>
        </div>
        <div class="cus-dh-abi-item dh-item-green">
            <p class="cus-dh-item-title">Total Student</p>
            <span class="cus-dh-item-icon"><i class="fa fa-graduation-cap" aria-hidden="true"></i></span>
            <p class="cus-dh-item-quan">1</p>
            <p class="cus-dh-item-des">Pending Students <span>0</span></p>
        </div>
        <div class="cus-dh-abi-item dh-item-orange">
            <p class="cus-dh-item-title">Teachers Salary</p>
            <span class="cus-dh-item-icon"><i class="fa fa-graduation-cap" aria-hidden="true"></i></span>
            <p class="cus-dh-item-quan">500</p>
            <p class="cus-dh-item-des">Pending Salary <span>0</span></p>
        </div>
        <div class="cus-dh-abi-item dh-item-red">
            <p class="cus-dh-item-title">Student Fee</p>
            <span class="cus-dh-item-icon"><i class="fa fa-graduation-cap" aria-hidden="true"></i></span>
            <p class="cus-dh-item-quan">500</p>
            <p class="cus-dh-item-des">Pending Dues <span>0</span></p>
        </div>
    </div>
    </Card>
);
