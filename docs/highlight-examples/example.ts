import { Component, OnInit } from '@angular/core'
import { HttpClient } from '@angular/common/http'
import { Observable } from 'rxjs'

interface User {
  id: number
  name: string
  email: string
}

@Component({
  selector: 'app-users',
  templateUrl: './users.component.html',
  styleUrls: ['./users.component.scss'],
})
export class UsersComponent implements OnInit {
  users$: Observable<User[]>

  constructor(private http: HttpClient) {}

  ngOnInit(): void {
    let myVariable: string = 'My name'

    this.users$ = this.http.get<User[]>(
      'https://jsonplaceholder.typicode.com/users'
    )
  }
}
